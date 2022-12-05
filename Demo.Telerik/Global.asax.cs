using System;
using System.Web;

namespace Demo.Telerik
{
    public class Global : HttpApplication
    {
        public override void Init ()
        {
            AuthenticateRequest += (sender, args) =>
            {
                Context.Items.Add ("A", 34);
            };

            
        }

        private void Application_Start()
        {
            Console.WriteLine ("Application_Start");
        }

        private void Application_End()
        {
            Console.WriteLine("Application_End");
        }

        private void Session_End()
        {
            Console.WriteLine("Session_End");
        }
    }
}