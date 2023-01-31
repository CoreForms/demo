using System;
using System.Threading;
using System.Web.UI;
using Demo.ObjectSession.Util;

namespace Demo.ObjectSession
{
    public class _ReadOnlySessionPage : Page
    {
        protected System.Web.UI.WebControls.Label TestLabel;

        protected void ShowCounter(object sender, EventArgs e)
        {
            var before = Session.GetCounter();

            Thread.Sleep(3000);

            var after = Session.GetCounter();

            TestLabel.Text = $"{before} / {after}";
        }

        protected void ShowCounterNow (object sender, EventArgs e)
        {
            TestLabel.Text = $"{Session.GetCounter()}";
        }
    }
}