using System;

namespace ProjectZ
{
    partial class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Welcome to the program!");
            ReversingStringMethod();
        }

        static void ReversingStringMethod()
        {
            Console.WriteLine("Enter a string to reverse:");
            ReversingString1.ReversingString();
        }
    }
}
