using System;
using System.Linq;

class LongestSequence1
{
    static void LongestSequence()
    {
        int[] array = Console.ReadLine().Split().Select(int.Parse).ToArray();

        int longestSequenceLength = 1;
        int currentSequenceLength = 1;
        int element = array[0];
        int longestSequenceElement = element;

        for (int i = 1; i < array.Length; i++)
        {
            if (array[i] == array[i - 1])
            {
                currentSequenceLength++;
                if (currentSequenceLength > longestSequenceLength)
                {
                    longestSequenceLength = currentSequenceLength;
                    longestSequenceElement = array[i];
                }
            }
            else
            {
                currentSequenceLength = 1;
            }
        }

        for (int i = 0; i < longestSequenceLength; i++)
        {
            Console.Write(longestSequenceElement + " ");
        }
    }
}
