using System;
using System.Collections.Generic;

namespace generic_sort
{
    public class GenericComparer<T> : IComparer<T> where T : IComparable
    {
        private Func<T, T, int> ComparerFunction { set; get; }

        public GenericComparer(Func<T, T, int> comparerFunction)
        {
            ComparerFunction = comparerFunction;
        }

        public int Compare(T x, T y)
        {
            if (x == null || y == null)
            {
                if (y == null && x == null) { return 0; }
                if (y == null) { return 1; }
                return -1;
            }

            return ComparerFunction(x, y);
        }
    }
}