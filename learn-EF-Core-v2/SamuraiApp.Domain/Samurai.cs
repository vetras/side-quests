using System;
using System.Collections.Generic;

namespace SamuraiApp.domain
{
    public class Samurai
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public List<Quote> Qoutes { get; set; } = new List<Quote>();
        public Clan Clan { get; set; }
    }
}