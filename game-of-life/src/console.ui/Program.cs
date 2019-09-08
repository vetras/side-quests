using System;
using System.IO;
using GameOfLife.Engine;
using Microsoft.Extensions.Configuration;

namespace GameOfLife.Ui
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            var builder = new ConfigurationBuilder()
                          .SetBasePath(Directory.GetCurrentDirectory())
                          .AddJsonFile("appSettings.json", optional: false, reloadOnChange: true);
                          
            IConfigurationRoot configuration = builder.Build();

            
            var engine = new GameEngine();

            engine.LoadInitialStateFromFile();
        }
    }
}
