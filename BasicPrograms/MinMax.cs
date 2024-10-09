using System;

namespace UnderstandingTypes
{
    class MinMax
    {
        static void Main2(string[] args)
        {
            Console.WriteLine("Number Type Information:");

            Console.WriteLine($"sbyte: Size = {sizeof(sbyte)} bytes, Min = {sbyte.MinValue}, Max = {sbyte.MaxValue}");
            Console.WriteLine($"byte: Size = {sizeof(byte)} bytes, Min = {byte.MinValue}, Max = {byte.MaxValue}");
            Console.WriteLine($"short: Size = {sizeof(short)} bytes, Min = {short.MinValue}, Max = {short.MaxValue}");
            Console.WriteLine($"ushort: Size = {sizeof(ushort)} bytes, Min = {ushort.MinValue}, Max = {ushort.MaxValue}");
            Console.WriteLine($"int: Size = {sizeof(int)} bytes, Min = {int.MinValue}, Max = {int.MaxValue}");
            Console.WriteLine($"uint: Size = {sizeof(uint)} bytes, Min = {uint.MinValue}, Max = {uint.MaxValue}");
            Console.WriteLine($"long: Size = {sizeof(long)} bytes, Min = {long.MinValue}, Max = {long.MaxValue}");
            Console.WriteLine($"ulong: Size = {sizeof(ulong)} bytes, Min = {ulong.MinValue}, Max = {ulong.MaxValue}");
            Console.WriteLine($"float: Size = {sizeof(float)} bytes, Min = {float.MinValue}, Max = {float.MaxValue}");
            Console.WriteLine($"double: Size = {sizeof(double)} bytes, Min = {double.MinValue}, Max = {double.MaxValue}");
            Console.WriteLine($"decimal: Size = {sizeof(decimal)} bytes, Min = {decimal.MinValue}, Max = {decimal.MaxValue}");
        }
    }
}