//Rextester.Program.Main is the entry point for your code. Don't change it.
//Compiler version 4.0.30319.17929 for Microsoft (R) .NET Framework 4.5

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace Rextester
{
    public class Program
    {
        public static void Main(string[] args)
        {
            String n = Console.ReadLine();
            int number = int.Parse(n);
            Show.triangle(number);
            
            Console.Write("\n\n\n");
            
            Time time = new Time(10,22,55);
            Console.Write(time);
            
            Console.Write("\n\n\n");
            
            AmericanTime timeA = new AmericanTime(13,22,55);
            Console.Write(timeA);
        }
    }
    
    public class Show
    {
        public static int square(int number)
        {
            return number * number;
        }
        
        public static void triangle(int number)
        {
            for(int i = 0; i < number; i++)
            {
                for(int j = 0; j <= i; j++)
                    Console.Write('*');
                Console.Write('\n');
            }
            
        }
    }
    
    public class Time
    {
        public int ora {get;set;}
        public int minut {get;set;}
        public int secunda {get;set;}
        
        public Time(){}
        
        public Time(int ora, int minut, int secunda)
        {
            this.ora = ora;
            this.minut = minut;
            this.secunda = secunda;
        }
        
        public override String ToString()
        {
            return String.Format("{0}:{1}:{2}", ora, minut, secunda);
        }
    }
    
    public class AmericanTime:Time
    {
        String meridian;
        
        public AmericanTime(int ora, int minut, int secunda):base(ora, minut, secunda){}
        
        public override String ToString()
        {

            if(this.ora >= 12)
            {
                this.meridian = "PM";
                this.ora = this.ora - 12;
            }   
            else
            {
                this.meridian = "AM";
            }
            
            return String.Format("{0}:{1}:{2} {3}", this.ora, this.minut, this.secunda, this.meridian);
        }
    }
}




















