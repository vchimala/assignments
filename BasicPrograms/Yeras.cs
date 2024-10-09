
            Console.Write("Enter the number of centuries: ");
            int centuries = int.Parse(Console.ReadLine());

            long years = centuries * 100;
            long days = years * 365 + (centuries / 4); // Accounting for leap years
            long hours = days * 24;
            long minutes = hours * 60;
            long seconds = minutes * 60;
            long milliseconds = seconds * 1000;
            long microseconds = milliseconds * 1000;
            long nanoseconds = microseconds * 1000;

            Console.WriteLine($"{centuries} centuries = {years} years = {days} days = {hours} hours = {minutes} minutes = {seconds} seconds = {milliseconds} milliseconds = {microseconds} microseconds = {nanoseconds} nanoseconds");
            int correctNumber = new Random().Next(3) + 1;
            Console.WriteLine("Guess a number between 1 and 3:");
            int userGuess;
            
            while (true)
            {
                string input = Console.ReadLine();
                
                if (!int.TryParse(input, out userGuess))
                {
                    Console.WriteLine("Please enter a valid integer.");
                    continue;
                }

                if (userGuess < 1 || userGuess > 3)
                {
                    Console.WriteLine("The guess is outside the valid range. Please guess a number between 1 and 3.");
                }
                else if (userGuess < correctNumber)
                {
                    Console.WriteLine("Too low! Try again.");
                }
                else if (userGuess > correctNumber)
                {
                    Console.WriteLine("Too high! Try again.");
                }
                else
                {
                    Console.WriteLine("Correct! You guessed the number.");
                    break;
                }
            }
        