namespace hexaware_assignment_code;
class Program
{
    static void Main(string[] args)
    {
        #region
        //1.Write a program that checks whether a given order is delivered or not based on its status(e.g.,
        //"Processing," "Delivered," "Cancelled"). Use if-else statements for this.
        //Create a program that simulates an ATM transaction.Display options such as "Check Balance,
        //" "Withdraw, " "Deposit, ".Ask the user to enter their current balance and the amount
        //they want to withdraw or deposit.Implement checks to ensure that the withdrawal
        //amount is not greater than the available balance and that the withdrawalamount is in
        //multiples of 100 or 500.Display appropriate messages for success or failure.

        //assignment q and a
        //Console.WriteLine("enter the staus of the courier");
        //string status = Console.ReadLine();
        //if (status.ToLower() == "processing")
        //{
        //    Console.WriteLine("Your courier is being processed");


        //}
        //else if (status.ToLower() == "cancelled")
        //{
        //    Console.WriteLine("your order has been cancelled");

        //}
        //else
        //{
        //    Console.WriteLine("your order has been delivered");

        //}
        #endregion
        #region
        //assignment2
        //        Console.Write("Enter parcel weight: ");
        //        double weight = Convert.ToDouble(Console.ReadLine());


        //        string category;
        //        switch (weight)
        //        {
        //            case double w when (w < 5):
        //                category = "Light";
        //                break;
        //            case double w when (w >= 5 && w < 20):
        //                category = "Medium";
        //                break;
        //            case double w when (w >= 20):
        //                category = "Heavy";
        //                break;
        //            default:
        //                category = "Unknown";
        //                break;
        //        }

        //        Console.WriteLine($"The parcel is categorized as: {category}");
        //    }
        //}
        #endregion
        #region assign3
        //assign3

        //        string[] employeeUsernames = { "rina", "gira" };
        //        string[] employeePasswords = { "awhs", "ushjs" };

        //        string[] customerUsernames = { "harish", "naren" };
        //        string[] customerPasswords = { "ppjk", "ujsk" };


        //        Console.WriteLine("Login as an employee or a customer?");
        //        string userType = Console.ReadLine().ToLower();


        //        switch (userType)
        //        {
        //            case "employee":
        //                Authenuser(employeeUsernames, employeePasswords);
        //                break;
        //            case "customer":
        //                Authenuser(customerUsernames, customerPasswords);
        //                break;
        //            default:
        //                Console.WriteLine("Invalid user type!");
        //                break;
        //        }
        //    }

        //    static void Authenuser(string[] usernames, string[] passwords)
        //    {
        //        Console.Write("Enter username: ");
        //        string username = Console.ReadLine();
        //        Console.Write("Enter password: ");
        //        string password = Console.ReadLine();


        //        bool isAuthenticated = false;
        //        for (int i = 0; i < usernames.Length; i++)
        //        {
        //            if (usernames[i] == username && passwords[i] == password)
        //            {
        //                isAuthenticated = true;
        //                break;
        //            }
        //        }


        //        if (isAuthenticated)
        //        {
        //            Console.WriteLine("Authentication successful!");
        //        }
        //        else
        //        {
        //            Console.WriteLine("Authentication failed. Invalid username or password.");
        //        }





        #endregion
    }
}
