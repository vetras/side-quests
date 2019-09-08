namespace sandbox
{
    using System.Collections.Generic;
    using System;
    using System.Linq;

    class Solution
    {
        static void miniMaxSum(int[] arr)
        {
            List<int> list = arr.ToList();
            int min = list.Min();
            int max = list.Where(x => x >= 0).Max();
            int sum = list.Sum();
            Console.WriteLine("{0} {1}", sum - max, sum - min);
        }

        public static void Main(string[] args)
        {
            int[] arr = { 1,2,3,4,-5 };
            miniMaxSum(arr);

            Console.WriteLine("Result: {0}", string.Join(" ", 0));
            Console.ReadKey();
        }

    }
}
