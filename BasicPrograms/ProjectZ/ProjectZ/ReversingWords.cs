using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

class ReversingWords1
{
    static void ReversingWords()
    {
        string input = Console.ReadLine();
        string pattern = @"(\b\w+\b)|([.,:;=()\[\]""'\\/!? ]+)";
        var matches = Regex.Matches(input, pattern);

        List<string> words = new List<string>();
        List<string> separators = new List<string>();

        foreach (Match match in matches)
        {
            if (Regex.IsMatch(match.Value, @"\b\w+\b"))
            {
                words.Add(match.Value);
            }
            else
            {
                separators.Add(match.Value);
            }
        }

        words.Reverse();
        int wordIndex = 0;
        int separatorIndex = 0;

        while (wordIndex < words.Count || separatorIndex < separators.Count)
        {
            if (separatorIndex < separators.Count)
            {
                Console.Write(separators[separatorIndex]);
                separatorIndex++;
            }

            if (wordIndex < words.Count)
            {
                Console.Write(words[wordIndex]);
                wordIndex++;
            }
        }
        Console.WriteLine();
    }
}
