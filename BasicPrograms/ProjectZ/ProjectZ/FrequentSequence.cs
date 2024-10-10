using System;
using System.Collections.Generic;
using System.Linq;

class FrequentSequence1
{
    static void FrequentSequence()
    {
        int[] array = Console.ReadLine().Split().Select(int.Parse).ToArray();
        Dictionary<int, int> frequencyMap = new Dictionary<int, int>();

        foreach (int number in array)
        {
            if (frequencyMap.ContainsKey(number))
            {
                frequencyMap[number]++;
            }
            else
            {
                frequencyMap[number] = 1;
            }
        }

        int mostFrequentNumber = array[0];
        int maxFrequency = frequencyMap[mostFrequentNumber];

        foreach (var pair in frequencyMap)
        {
            if (pair.Value > maxFrequency || (pair.Value == maxFrequency && Array.IndexOf(array, pair.Key) < Array.IndexOf(array, mostFrequentNumber)))
            {
                mostFrequentNumber = pair.Key;
                maxFrequency = pair.Value;
            }
        }

        Console.WriteLine($"The number {mostFrequentNumber} is the most frequent (occurs {maxFrequency} times)");
    }
}
