"""Offline valid/corrupt final-package fixtures; compile only with Lua 5.1."""

import contextlib
import importlib.util
import io
import os
import pathlib
import struct
import tempfile
import unittest
from unittest.mock import patch
import zipfile

SPEC = importlib.util.spec_from_file_location(
    "validate_package", pathlib.Path(__file__).parents[1] / ".github/scripts/validate-package.py")
VALIDATOR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(VALIDATOR)
LUAC = os.environ.get("LUAC", "luac5.1")


class PackageTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.archive = pathlib.Path(self.temp.name) / "ATT.zip"
        self.files = {
            "AllTheThings/AllTheThings.toc": (
                "## Interface: 11509, 16001, 20506, 30405, 40402, 50504, 120100\n"
                "# ignored-missing.lua\nmain.lua\ndb\\[Game]\\ReferenceDB.lua\n"
                "db\\[Game]\\Database.xml\n"
                "retail.lua [AllowLoadGameType mainline]\n"
                "classic.lua [ExcludeLoadGameType mainline]\n"
                "missing.lua [AllowLoadGameType titan]\n"
                "[Family]\\family.lua\n"),
            "AllTheThings/main.lua": b"\xef\xbb\xbflocal value = '\\x1F'; return value\n",
            "AllTheThings/retail.lua": "return true\n",
            "AllTheThings/classic.lua": "return true\n",
            "AllTheThings/Mainline/family.lua": "return true\n",
            "AllTheThings/Classic/family.lua": "return true\n",
        }
        for game in VALIDATOR.GAMES:
            self.files.update({
                f"AllTheThings/db/{game}/ReferenceDB.lua": "return {}\n",
                f"AllTheThings/db/{game}/Database.xml": '<Ui xmlns="http://www.blizzard.com/wow/ui/"><Include file="nested.xml"/></Ui>',
                f"AllTheThings/db/{game}/nested.xml": '<Ui><Script file="data.lua"/></Ui>',
                f"AllTheThings/db/{game}/data.lua": "return {}\n",
            })

    def write_archive(self):
        with zipfile.ZipFile(self.archive, "w", zipfile.ZIP_STORED) as package:
            for name, content in self.files.items():
                package.writestr(name, content)

    def validate(self):
        self.write_archive()
        with contextlib.redirect_stdout(io.StringIO()):
            VALIDATOR.validate_archive(self.archive, LUAC)

    def test_valid_all_flavors_bom_spaces_and_conditions(self):
        self.files["AllTheThings/space file.lua"] = "return ...\n"
        self.files["AllTheThings/AllTheThings.toc"] += "space file.lua [AllowLoadGameType classic, mainline]\n"
        self.validate()

    def test_select_only_applicable_flavored_toc(self):
        self.files["AllTheThings/AllTheThings_Mainline.toc"] = "db\\[Game]\\OnlyRetail.lua [AllowLoadGameType mainline]\n"
        self.files["AllTheThings/db/Standard/OnlyRetail.lua"] = "return true\n"
        self.files["AllTheThings/AllTheThings_Vanilla.toc"] = "db\\[Game]\\OnlyEra.lua\n"
        for game in ("Vanilla", "VanillaSOD"):
            self.files[f"AllTheThings/db/{game}/OnlyEra.lua"] = "return true\n"
        self.validate()

    def test_flavored_tocs_without_generic_fallback(self):
        del self.files["AllTheThings/AllTheThings.toc"]
        for suffixes in VALIDATOR.TOC_SUFFIXES.values():
            suffix = suffixes[0]
            self.files[f"AllTheThings/AllTheThings_{suffix}.toc"] = "main.lua\n"
        self.validate()

    def test_missing_applicable_flavored_toc(self):
        del self.files["AllTheThings/AllTheThings.toc"]
        self.files["AllTheThings/AllTheThings_Mainline.toc"] = "main.lua\n"
        with self.assertRaisesRegex(ValueError, "Missing Vanilla TOC"):
            self.validate()

    def test_camelot_packager_family_is_mainline(self):
        self.assertEqual(VALIDATOR.family("Camelot"), "Mainline")
        self.assertIsNone(VALIDATOR.toc_reference("missing.lua [AllowLoadGameType classic]", "Camelot"))
        self.assertEqual(VALIDATOR.toc_reference("file.lua [ExcludeLoadGameType classic]", "Camelot"), "file.lua")

    def test_require_lua_51(self):
        result = VALIDATOR.subprocess.CompletedProcess([], 0, b"", b"Lua 5.4.0")
        with patch.object(VALIDATOR.subprocess, "run", return_value=result):
            with self.assertRaisesRegex(ValueError, "require Lua 5.1"):
                self.validate()

    def test_missing_entire_database_flavor(self):
        for name in list(self.files):
            if name.startswith("AllTheThings/db/VanillaSOD/"):
                del self.files[name]
        with self.assertRaisesRegex(ValueError, "Missing VanillaSOD reference"):
            self.validate()

    def test_missing_toc_reference(self):
        self.files["AllTheThings/AllTheThings.toc"] += "missing.lua\n"
        with self.assertRaisesRegex(ValueError, "Missing Standard reference"):
            self.validate()

    def test_missing_nested_xml_reference(self):
        del self.files["AllTheThings/db/Wrath/data.lua"]
        with self.assertRaisesRegex(ValueError, "Missing Wrath reference"):
            self.validate()

    def test_invalid_xml(self):
        self.files["AllTheThings/db/Cata/Database.xml"] = "<Ui>"
        with self.assertRaises(VALIDATOR.ET.ParseError):
            self.validate()

    def test_invalid_lua(self):
        self.files["AllTheThings/main.lua"] = "local =\n"
        with self.assertRaisesRegex(ValueError, "main.lua:"):
            self.validate()

    def test_lua_52_syntax_is_rejected(self):
        self.files["AllTheThings/main.lua"] = "goto done\n::done::\n"
        with self.assertRaisesRegex(ValueError, "main.lua:"):
            self.validate()

    def test_wrong_archive_root(self):
        del self.files["AllTheThings/AllTheThings.toc"]
        with self.assertRaisesRegex(ValueError, "missing an AllTheThings TOC"):
            self.validate()

    def test_traversal(self):
        self.files["../escape.lua"] = "return true"
        with self.assertRaisesRegex(ValueError, "Unsafe ZIP path"):
            self.validate()

    def test_reference_traversal(self):
        self.files["AllTheThings/AllTheThings.toc"] += "../escape.lua\n"
        with self.assertRaisesRegex(ValueError, "Reference escapes addon"):
            self.validate()

    def test_duplicate_member(self):
        self.write_archive()
        with zipfile.ZipFile(self.archive, "a") as package:
            with self.assertWarns(UserWarning):
                package.writestr("AllTheThings/main.lua", "return false")
        with self.assertRaisesRegex(ValueError, "Duplicate or symlink"):
            VALIDATOR.validate_archive(self.archive, LUAC)

    def test_symlink(self):
        self.write_archive()
        entry = zipfile.ZipInfo("AllTheThings/link.lua")
        entry.external_attr = 0o120777 << 16
        with zipfile.ZipFile(self.archive, "a") as package:
            package.writestr(entry, "../../escape")
        with self.assertRaisesRegex(ValueError, "Duplicate or symlink"):
            VALIDATOR.validate_archive(self.archive, LUAC)

    def test_corrupt_crc(self):
        self.write_archive()
        with zipfile.ZipFile(self.archive) as package:
            entry = package.getinfo("AllTheThings/main.lua")
        data = bytearray(self.archive.read_bytes())
        name_length, extra_length = struct.unpack_from("<HH", data, entry.header_offset + 26)
        data[entry.header_offset + 30 + name_length + extra_length] ^= 1
        self.archive.write_bytes(data)
        with self.assertRaisesRegex(ValueError, "ZIP CRC failure"):
            VALIDATOR.validate_archive(self.archive, LUAC)

    def test_truncated_zip(self):
        self.write_archive()
        self.archive.write_bytes(self.archive.read_bytes()[:-100])
        with self.assertRaises(zipfile.BadZipFile):
            VALIDATOR.validate_archive(self.archive, LUAC)


if __name__ == "__main__":
    unittest.main()
