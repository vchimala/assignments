using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

class Program
{
    static void Main()
    {
        string input = Console.ReadLine();
        string pattern = @"\b\w+\b";
        var matches = Regex.Matches(input, pattern);

        HashSet<string> palindromes = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        foreach (Match match in matches)
        {
            string word = match.Value;
            if (IsPalindrome(word))
            {
                palindromes.Add(word);
            }
        }

        var sortedPalindromes = palindromes.OrderBy(p => p, StringComparer.OrdinalIgnoreCase);
        Console.WriteLine(string.Join(", ", sortedPalindromes));
    }

    static bool IsPalindrome(string word)
    {
        int left = 0;
        int right = word.Length - 1;

        while (left < right)
        {
            if (char.ToLower(word[left]) != char.ToLower(word[right]))
            {
                return false;
            }
            left++;
            right--;
        }
        return true;
    }
}
