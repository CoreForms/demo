<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Telerik4.aspx.cs" Inherits="Demo.Telerik.TreeView" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat="server">
    <title>Telerik ASP.NET Example</title>
    <link rel="stylesheet" type="text/css" href="styles4.css" />
</head>
<body>
    <p>
        This demo was adapted from <a href="https://demos.telerik.com/aspnet-ajax/treeview">https://demos.telerik.com/aspnet-ajax/treeview</a>
    </p>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <script type="text/javascript" src="scripts4.js"></script>
    <telerik:RadCodeBlock runat="Server" ID="RadCodeBlock1">
        <script type="text/javascript">
            //<![CDATA[
            Sys.Application.add_load(function() {
                demo.priceCheckerID = "<%= priceChecker.ClientID%>";
                demo.gridID = "<%=RadGrid1.ClientID %>";
                demo.initialize();
            });
            //]]>
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadTreeView1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadTreeView1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadTreeView2"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="priceChecker"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadTreeView2">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadTreeView1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadTreeView2"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="priceChecker"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="demo-container no-bg size-wide">
        <img class="header" src="images/top.jpg" alt="Starski &amp; Sons Travel Agency" />
        <div class="demo-content" >
            <p class="main-description">Drag a package from Travel Packages to Favorites to create your wishtree.</p>
            <div class="treeViewWrapper">
                <telerik:RadTreeView RenderMode="Lightweight" runat="Server" ID="RadTreeView1" EnableDragAndDrop="true" OnNodeDrop="RadTreeView1_NodeDrop"
                    OnClientNodeDropping="onDropping" EnableDragAndDropBetweenNodes="false" Skin="Vista" >
                    <Nodes>
                        <telerik:RadTreeNode runat="server" Text="Island" Expanded="true" AllowDrag="false"
                            AllowDrop="false">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="Zanzibar" AllowDrag="false">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="Weekend Package" AllowDrop="false" Value="1999">
                                        </telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="1 Week Package" AllowDrop="false" Value="2999">
                                        </telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="2 Week Package" AllowDrop="false" Value="3999">
                                        </telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="Mauritius" AllowDrag="false">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="Weekend Package" AllowDrop="false" Value="2999">
                                        </telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="1 Week Package" AllowDrop="false" Value="3999">
                                        </telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="2 Week Package" AllowDrop="false" Value="4999">
                                        </telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="Maldives" Expanded="true" AllowDrag="false">
                                    <Nodes>
                                        <telerik:RadTreeNode runat="server" Text="Weekend Package" AllowDrop="false" Value="3999">
                                        </telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="1 Week Package" AllowDrop="false" Value="4999">
                                        </telerik:RadTreeNode>
                                        <telerik:RadTreeNode runat="server" Text="2 Week Package" AllowDrop="false" Value="5999">
                                        </telerik:RadTreeNode>
                                    </Nodes>
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                    </Nodes>
                </telerik:RadTreeView>
            </div>
            <div class="treeViewWrapper" >
                <telerik:RadTreeView RenderMode="Lightweight" runat="Server" ID="RadTreeView2" EnableDragAndDropBetweenNodes="false"
                    OnClientNodeDropping="onDropping" EnableDragAndDrop="true" OnNodeDrop="RadTreeView2_NodeDrop" 
                    Skin="Vista">
                    <Nodes>
                        <telerik:RadTreeNode runat="server" Text="Island" Expanded="true" AllowDrag="false" AllowDrop="false">
                            <Nodes>
                                <telerik:RadTreeNode runat="server" Text="Zanzibar" AllowDrag="false">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="Mauritius" AllowDrag="false">
                                </telerik:RadTreeNode>
                                <telerik:RadTreeNode runat="server" Text="Maldives" AllowDrag="false">
                                </telerik:RadTreeNode>
                            </Nodes>
                        </telerik:RadTreeNode>
                    </Nodes>
                </telerik:RadTreeView>
            </div>
            <div style="width: 266px; float: left">
                <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="RadGrid1" Width="266px" AutoGenerateColumns="false"
                    OnNeedDataSource="RadGrid1_NeedDataSource" OnItemDataBound="RadGrid1_ItemDataBound"
                    Skin="Vista">
                    <MasterTableView ShowHeadersWhenNoRecords="true" ShowFooter="true">
                        <FooterStyle CssClass="gridFooter"></FooterStyle>
                        <NoRecordsTemplate>
                            Drag and drop packages here...
                        </NoRecordsTemplate>
                        <Columns>
                            <telerik:GridBoundColumn DataField="Text" HeaderText="Item" UniqueName="Text">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Price" HeaderText="Price" DataFormatString="${0}"
                                UniqueName="Price">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <images src="images/checkOut.gif" alt="checkout" style="float: right; margin-top: 9px;" />
            </div>
            <div class="price-checker" id="priceChecker" runat="server">
                <div class="header">
                    Price Checker
                </div>
                <div class="description">
                    <asp:Label runat="server" Text="Drop a package here to check price" ID="Label1"></asp:Label>
                </div>
            </div>
            <div style="clear: both">
            </div>
        </div>
    </div>
    </form>
</body>
</html>