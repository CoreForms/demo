using System;
using System.Web.UI;
using Telerik.Web.UI;

namespace Demo.Telerik
{
    public partial class DataChart : Page
    {
        private bool overrideSelection = false;
        protected void RadGrid1_PreRender(object sender, EventArgs e)
        {
            if (!overrideSelection)
            {
                RadGrid1.MasterTableView.Items[0].Selected = true;
            }
        }
        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            overrideSelection = true;
        }

        protected RadGrid RadGrid1;
    }
}