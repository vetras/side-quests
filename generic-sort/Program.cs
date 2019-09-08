using System;
using System.Collections;
using System.Collections.Generic;

namespace generic_sort
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            var people = new List<Person>
            {
                new Person("nuno", 23),
                new Person("barbosa", 33),
                new Person("rita", 12),
                new Person("vetras", 2)
            };

            var stringCompare = new GenericComparer<string>(string.Compare);
            var int___Compare = new GenericComparer<int>((a, b) => a - b);

            var result = people.MySort(x => x.Name, stringCompare);
            Print(result);
            result = people.MySort(x => x.Age, int___Compare);
            Print(result);

            Console.ReadLine();
        }

        private static void Print(IList<Person> list)
        {
            foreach (var x in list)
            {
                Console.WriteLine($"{x.Name}: {x.Age}");
            }
            Console.WriteLine("----");

        }
    }
}
