using System;

namespace ProjectZ
{
    public class ReversingString1
    {
        public static void ReversingString()
        {
            string input = Console.ReadLine();
            for (int i = input.Length - 1; i >= 0; i--)
            {
                Console.Write(input[i]);
            }
            Console.WriteLine();
        }
    }
}
