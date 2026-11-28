using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using ATT;

internal static class Program
{
	private static readonly JsonData Json = ToolJson.Data;

	private static void Main(string[] args)
	{
		CultureInfo.CurrentCulture = CultureInfo.InvariantCulture;
		string operation = args[0];
		string input = args[1];
		string validationPath = args[2];
		int warmSamples = int.Parse(args[3]);

		Func<object> run;
		Func<object, string> validate;
		switch (operation)
		{
			case "read":
				string[] fixtures = File.ReadAllLines(input).Select(path => File.ReadAllText(path)).ToArray();
				run = () =>
				{
					foreach (string json in fixtures)
						GC.KeepAlive(Read(json));
					return null;
				};
				validate = value => Fingerprint(fixtures);
				break;
			case "ordinary-write":
			case "parser-write":
				bool parser = operation == "parser-write";
				var graph = parser ? CreateParserGraph() : Read(File.ReadAllText(input));
				run = () => parser ? Json.SerializeForParser(graph) : Json.Serialize(graph);
				validate = value =>
				{
					File.WriteAllText(validationPath, (string)value, new UTF8Encoding(false));
					return "-";
				};
				break;
			case "asset-keys":
				string assets = File.ReadAllText(input);
				run = () => Json.ReadObjectKeys(assets).Select(long.Parse).Distinct().OrderBy(key => key).ToArray();
				validate = value =>
				{
					File.WriteAllText(validationPath, string.Join(",", (long[])value), new UTF8Encoding(false));
					return "-";
				};
				break;
			default:
				throw new ArgumentException("Unknown operation " + operation);
		}

		using (var process = Process.GetCurrentProcess())
		{
			GC.Collect();
			GC.WaitForPendingFinalizers();
			GC.Collect();
			var result = Measure(process, "cold", run);
			for (int i = 0; i < 2; i++)
				GC.KeepAlive(run());
			for (int i = 0; i < warmSamples; i++)
				result = Measure(process, "warm", run);
			process.Refresh();
			Console.WriteLine("peak\t" + process.PeakWorkingSet64);
			Console.WriteLine("valid\t" + validate(result));
		}
	}

	private static object Measure(Process process, string phase, Func<object> work)
	{
		process.Refresh();
		TimeSpan cpuBefore = process.TotalProcessorTime;
		int gc0 = GC.CollectionCount(0);
		int gc1 = GC.CollectionCount(1);
		int gc2 = GC.CollectionCount(2);
		long allocatedBefore = GC.GetAllocatedBytesForCurrentThread();
		long start = Stopwatch.GetTimestamp();
		object result = work();
		double elapsed = (Stopwatch.GetTimestamp() - start) * 1000.0 / Stopwatch.Frequency;
		long allocated = GC.GetAllocatedBytesForCurrentThread() - allocatedBefore;
		process.Refresh();
		double cpu = (process.TotalProcessorTime - cpuBefore).TotalMilliseconds;
		Console.WriteLine(string.Join("\t", phase, elapsed, cpu, allocated, GC.CollectionCount(0) - gc0,
			GC.CollectionCount(1) - gc1, GC.CollectionCount(2) - gc2));
		return result;
	}

	private static object Read(string json)
	{
		var result = Json.Deserialize(json);
		if (!(result is Dictionary<string, object>) && !(result is List<object>))
			throw new InvalidDataException("Expected a JSON corpus container.");
		return result;
	}

	private static string Fingerprint(IEnumerable<string> fixtures)
	{
		using (var sha = SHA256.Create())
		using (var stream = new CryptoStream(Stream.Null, sha, CryptoStreamMode.Write))
		{
			var writer = new BinaryWriter(stream, new UTF8Encoding(false));
			foreach (string json in fixtures)
				WriteValue(writer, Read(json));
			writer.Flush();
			stream.FlushFinalBlock();
			return BitConverter.ToString(sha.Hash).Replace("-", "").ToLowerInvariant();
		}
	}

	private static void WriteValue(BinaryWriter writer, object value)
	{
		switch (value)
		{
			case null:
				writer.Write((byte)0);
				break;
			case Dictionary<string, object> dictionary:
				writer.Write((byte)1);
				writer.Write(dictionary.Count);
				foreach (string key in dictionary.Keys.OrderBy(key => key, StringComparer.Ordinal))
				{
					writer.Write(key);
					WriteValue(writer, dictionary[key]);
				}
				break;
			case List<object> list:
				writer.Write((byte)2);
				writer.Write(list.Count);
				foreach (object item in list)
					WriteValue(writer, item);
				break;
			case string text:
				writer.Write((byte)3);
				writer.Write(text);
				break;
			case long integer:
				writer.Write((byte)4);
				writer.Write(integer);
				break;
			case double real:
				writer.Write((byte)5);
				writer.Write(real);
				break;
			case bool boolean:
				writer.Write((byte)6);
				writer.Write(boolean);
				break;
			default:
				throw new InvalidDataException("Unexpected CLR type " + value.GetType());
		}
	}

	private static object CreateParserGraph()
	{
		var children = new List<object>();
		var root = new Dictionary<object, object> { { "g", children }, { 42L, children } };
		for (int i = 0; i < 4096; i++)
		{
			children.Add(new Dictionary<object, object>
			{
				{ "itemID", 10000L + i },
				{ "text", "Harbor 港口 \"quoted\"\nnext line" },
				{ "values", new Queue<object>(new object[] { i + 0.5, false, null }) },
				{ "__parent", root }
			});
		}
		return root;
	}
}
