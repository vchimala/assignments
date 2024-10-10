using System;
using System.Linq;

class ArrayofIntegers1
{
    static void ArrayofIntegers()
    {
        int[] array = Console.ReadLine().Split().Select(int.Parse).ToArray();
        int k = int.Parse(Console.ReadLine());

        int[] sum = new int[array.Length];

        for (int r = 1; r <= k; r++)
        {
            int[] rotated = new int[array.Length];
            for (int i = 0; i < array.Length; i++)
            {
                rotated[(i + r) % array.Length] = array[i];
            }

            for (int i = 0; i < array.Length; i++)
            {
                sum[i] += rotated[i];
            }
        }

        Console.WriteLine(string.Join(" ", sum));
    }
}
