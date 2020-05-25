using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TestWebApplication
{
    abstract public class User
    {
        public string Uname { get; set; }
        public string Upass { get; set; }
        public int Utype { get; set; }
        public int Ustatus { get; set; }

        abstract public void create();
    }

    public class SpecialUser : User
    {

        public override void create()
        {
            throw new NotImplementedException();
        }
    }

    abstract class Account
    {
        public int AccNo { get; set; }

        abstract public double checkBalance();
    }

    class Savings : Account
    {
        public double balance;

        sealed public override double checkBalance()
        {
            return balance;
        }

    }

    sealed class NormalSaving :Savings
    {
     
    }

    class Test
    {
        public void testMethod()
        {
            NormalSaving obj = new NormalSaving();
            obj.AccNo = 123456;
            obj.balance = 2500;

            obj.checkBalance();
        }
    }
}