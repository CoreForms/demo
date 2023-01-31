using System;
using System.Web.UI;
using Demo.ObjectSession.Util;

namespace Demo.ObjectSession
{
    public class _AppSession : Page
    {
        protected System.Web.UI.WebControls.Label TestLabel;

        protected void ShowCounter(object sender, EventArgs e)
        {
            TestLabel.Text = $"{Application.GetCounter()}";
        }

        protected void IncrementCounter (object sender, EventArgs e)
        {
            Application.IncrementCounter();
            TestLabel.Text = $"{Application.GetCounter()}";
        }
    }
}