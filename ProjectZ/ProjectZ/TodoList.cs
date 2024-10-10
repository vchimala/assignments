using System;
using System.Collections.Generic;

class TodoList1
{
    static void TodoList()
    {
        List<string> itemList = new List<string>();

        while (true)
        {
            Console.WriteLine("Enter command (+ item, - item, or -- to clear):");
            string input = Console.ReadLine();

            if (input.StartsWith("+"))
            {
                string itemToAdd = input.Substring(1).Trim();
                if (!string.IsNullOrEmpty(itemToAdd))
                {
                    itemList.Add(itemToAdd);
                    Console.WriteLine($"Added: {itemToAdd}");
                }
            }
            else if (input.StartsWith("-"))
            {
                string itemToRemove = input.Substring(1).Trim();
                if (itemList.Remove(itemToRemove))
                {
                    Console.WriteLine($"Removed: {itemToRemove}");
                }
                else
                {
                    Console.WriteLine($"Item not found: {itemToRemove}");
                }
            }
            else if (input == "--")
            {
                itemList.Clear();
                Console.WriteLine("List cleared.");
            }
            else
            {
                Console.WriteLine("Invalid command.");
            }

            Console.WriteLine("\nCurrent List:");
            if (itemList.Count == 0)
            {
                Console.WriteLine("The list is empty.");
            }
            else
            {
                foreach (var item in itemList)
                {
                    Console.WriteLine("- " + item);
                }
            }
            Console.WriteLine();
        }
    }
}
