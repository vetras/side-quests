using System;
using System.Collections.Generic;
using System.Linq;

namespace generic_sort
{
    public static class ListExtensions
    {
        public static IList<T> MySort<T, TKey>(
            this IList<T> list,
            Func<T, TKey> keySelector,
            IComparer<TKey> comparer)
        {
            return list.OrderBy(keySelector, comparer).ToList();
        }

        public static IList<T> MySort<T, TKey>(
            this IList<T> list,
            Func<T, TKey> keySelector)
        {
            return list.OrderBy(keySelector).ToList();
        }
    }
}
