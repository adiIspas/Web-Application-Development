using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Laboratory_2
{
    class Complex
    {
        double Real
        {
            get;
            set;
        }

        double Imaginary
        {
            get;
            set;
        }

        public Complex(double real, double imaginary)
        {
            this.Real = real;
            this.Imaginary = imaginary;
        }

        public override string ToString()
        {
            return "(" + this.Real + ", " + this.Imaginary + ")";
        }

        public double GetMagnitude()
        {
            return Math.Sqrt(this.Real * this.Real + this.Imaginary * this.Imaginary);
        }

        public Complex Add(Complex first)
        {
            double real = first.Real + this.Real;
            double imaginary = first.Imaginary + this.Imaginary;

            Complex result = new Complex(real, imaginary);

            return result;
        }


    }
}
