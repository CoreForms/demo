using System;
using System.Threading;
using System.Web.UI;
using Demo.ObjectSession.Util;

namespace Demo.ObjectSession
{
    public class _WriteSessionPage : Page
    {
        protected System.Web.UI.WebControls.Label TestLabel;

        protected void IncrementCounterNow(object sender, EventArgs e)
        {
            var before = Session.GetCounter();

            Session.IncrementCounter();
            var after = Session.GetCounter();

            TestLabel.Text = $"{before} -> {after}";
        }

        protected void IncrementCounterBeforeDelay(object sender, EventArgs e)
        {
            var before = Session.GetCounter();
            Session.IncrementCounter();

            Thread.Sleep(3000);

            var after = Session.GetCounter();

            TestLabel.Text = $"{before} -> {after}";
        }

        protected void IncrementCounterAfterDelay(object sender, EventArgs e)
        {
            var before = Session.GetCounter();

            Thread.Sleep(3000);

            Session.IncrementCounter();
            var after = Session.GetCounter();

            TestLabel.Text = $"{before} -> {after}";
        }
    }
}