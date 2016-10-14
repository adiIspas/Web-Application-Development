using System;
using System.Collections.Generic;
using System.Linq;

namespace Laboratory_2
{
    class Program
    {
        static void Main(string[] args)
        {
            ExecutieProgram(new TelefonMobil(1245), new Telefon4G(3212));

            Complex number_one = new Complex(1, -2);
            Complex number_two = new Complex(5, -7);

            Console.WriteLine(number_one + " " + number_two);
            Console.WriteLine(number_one.GetMagnitude() + " " + number_two.GetMagnitude() + " " + Math.Sqrt(7));
            Console.WriteLine(number_one.Add(number_two));

            Console.ReadKey();
        }

        static void ExecutieProgram(TelefonMobil t1, TelefonMobil t2)
        {
            //polimorfism de compilare. Stim ce metoda se va apela dupa signatura ei.
            t1.SunaNumar(123);
            t1.SunaNumar("321");
            t2.SunaNumar(123);

            //poliorfism de executie
            t1.ConnectareRetea();
            t2.ConnectareRetea();


            List<int> iList = new List<int>();
            iList.Add(3);
            Dictionary<string,string> capitale = new Dictionary<string,string>();
            capitale.Add("Romania", "Bucuresti");

            Dictionary<string, TelefonMobil> telefoane = new Dictionary<string, TelefonMobil>();
            telefoane.Add("Lumia", new Telefon4G(1));
            telefoane.Add("iPhone", new Telefon4G(2));
            telefoane.Add("huawei", new TelefonMobil(3));
            //selectati toate numele telefoanelor 4g si inseratile intr-o lista.
            
            var telefoane4g = telefoane.Where(item => item.Value is Telefon4G)
                                       .Select(item => item.Key)
                                       .ToList();

            foreach(KeyValuePair<string, TelefonMobil> telefon in telefoane)
            {
                Console.WriteLine(telefon.Key);
            }

            foreach (string telefon in telefoane4g)
            {
                Console.WriteLine(telefon);
            }
        }
    }

    public class TelefonMobil
    {
        protected int m_numar;

        public TelefonMobil(int numar)
        {
            m_numar = numar;
        }

        // va apela ultimul numar format
        public void SunaNumar()
        {
        }
        //va apela numarul trimis ca parametru
        public void SunaNumar(int numar)
        {
            Console.WriteLine(numar.ToString());
        }
        public void SunaNumar(string numar)
        {
            Console.WriteLine(numar);
        }

        public virtual void ConnectareRetea()
        {
            Console.WriteLine("Connectare retea");
        }

        public override string ToString()
        {
            return "" + this.m_numar;
        }
    }

    public class Telefon4G : TelefonMobil
    {
        public Telefon4G(int numar) : base(numar) { }

        public override void ConnectareRetea()
        {
            Console.WriteLine("Connectare retea LTE!");
        }
    }
}
