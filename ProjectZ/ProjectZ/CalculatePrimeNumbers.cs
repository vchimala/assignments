using System;
using System.Collections.Generic;

class CalculatePrimeNumbers1
{
    static void CalculatePrimeNumbers()
    {
        int[] primes = FindPrimesInRange(10, 50);
        Console.WriteLine(string.Join(", ", primes));
    }

    static int[] FindPrimesInRange(int startNum, int endNum)
    {
        List<int> primes = new List<int>();

        for (int num = Math.Max(startNum, 2); num <= endNum; num++)
        {
            if (IsPrime(num))
            {
                primes.Add(num);
            }
        }

        return primes.ToArray();
    }

    static bool IsPrime(int number)
    {
        if (number < 2) return false;
        for (int i = 2; i <= Math.Sqrt(number); i++)
        {
            if (number % i == 0)
                return false;
        }
        return true;
    }
}
