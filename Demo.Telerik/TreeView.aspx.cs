using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Demo.Telerik
{
    public class TreeView : Page
    {
        private const string SessionKey = "Telerik.Web.Examples.TreeView.Overview.DefaultCS";

        class PackageItem
        {
            private string text;

            public string Text
            {
                get { return text; }
                set { text = value; }
            }

            private int price;

            public int Price
            {
                get { return price; }
                set { price = value; }
            }
        }

        protected RadGrid RadGrid1;
        protected Label Label1;

        protected void RadTreeView1_NodeDrop(object sender, RadTreeNodeDragDropEventArgs e)
        {
            PerformDragDrop(e);
        }

        private void PerformDragDrop(RadTreeNodeDragDropEventArgs e)
        {
            RadTreeNode sourceNode = e.SourceDragNode;
            RadTreeNode destinationNode = e.DestDragNode;

            if (destinationNode != null)
            {
                MoveNode(e.DropPosition, sourceNode, destinationNode);
            }
            else if (e.HtmlElementID.EndsWith("priceChecker"))
            {
                Label1.Text = "The price of '" + sourceNode.Text + "' is : $" + sourceNode.Value;
                Label1.CssClass = "results";
            }
            else if (e.HtmlElementID == RadGrid1.ClientID)
            {
                if (sourceNode.Value != String.Empty)
                {
                    PackageItem item = new PackageItem();
                    item.Text = sourceNode.Text;
                    item.Price = Convert.ToInt32(sourceNode.Value);
                    PackageItems.Add(item);
                }
                RadGrid1.Rebind();
            }
        }

        protected void RadTreeView2_NodeDrop(object sender, RadTreeNodeDragDropEventArgs e)
        {
            PerformDragDrop(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private IList<PackageItem> PackageItems
        {
            get
            {
                IList<PackageItem> packages = Session[SessionKey] as IList<PackageItem>;
                if (packages == null)
                {
                    packages = new List<PackageItem>();
                    Session[SessionKey] = packages;
                }
                return packages;
            }
        }

        private void MoveNode(RadTreeViewDropPosition dropPosition, RadTreeNode sourceNode, RadTreeNode destNode)
        {
            if (sourceNode == destNode || sourceNode.IsAncestorOf(destNode))
            {
                return;
            }

            sourceNode.Owner.Nodes.Remove(sourceNode);

            switch (dropPosition)
            {
                case RadTreeViewDropPosition.Over:
                    // child
                    if (!sourceNode.IsAncestorOf(destNode))
                    {
                        destNode.Nodes.Add(sourceNode);
                        destNode.Expanded = true;
                    }
                    break;

                case RadTreeViewDropPosition.Above:
                    // sibling - above                    
                    destNode.InsertBefore(sourceNode);
                    break;

                case RadTreeViewDropPosition.Below:
                    // sibling - below
                    destNode.InsertAfter(sourceNode);
                    break;
            }

            sourceNode.Selected = false;
        }

        protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = PackageItems;
        }

        int total = 0;

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                total += Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "Price"));
            }
            else if (e.Item is GridFooterItem)
            {
                GridFooterItem footer = e.Item as GridFooterItem;
                footer["Text"].Text = "Subtotal (" + RadGrid1.Items.Count + " items):";
                footer["Price"].Text = "$" + total;
            }
        }
    }
}