using System;

class CopyofArray1
{
    static void CopyofArray()
    {
        int[] originalArray = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
        int[] copiedArray = new int[originalArray.Length];

        for (int i = 0; i < originalArray.Length; i++)
        {
            copiedArray[i] = originalArray[i];
        }

        Console.WriteLine("Original Array:");
        foreach (int item in originalArray)
        {
            Console.Write(item + " ");
        }

        Console.WriteLine("\nCopied Array:");
        foreach (int item in copiedArray)
        {
            Console.Write(item + " ");
        }
    }
}
