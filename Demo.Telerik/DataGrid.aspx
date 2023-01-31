<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Telerik3.aspx.cs" Inherits="Demo.Telerik.DataGrid" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat="server">
    <title>Telerik ASP.NET Example</title>
    <link href="styles.css" rel="stylesheet" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            var radWindow1 = null;
            var radGrid1 = null;
            var panelStep1 = null;
            var panelStep2 = null;
 
            function pageLoad() {
                radGrid1 = $find("<%= RadGrid1.ClientID %>");
                radWindow1 = $find("<%= RadWindow1.ClientID %>");
                panelStep1 = $get("<%= FirstStepPanel.ClientID %>");
                panelStep2 = $get("<%= SecondStepPanel.ClientID %>");
            }
        </script>
    </telerik:RadCodeBlock>
    <script type="text/javascript" src="scripts.js"></script>
</head>
<body>
    <p>
        This demo was adapted from <a href="https://demos.telerik.com/aspnet-ajax/grid/ ">https://demos.telerik.com/aspnet-ajax/grid/</a>
    </p>
    <p>
        Because the original demo used an EntityFramework provider that is no longer usable in .NET, the data source was adjusted to a simple query against the Northwind database.
    </p>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <div class="demo-container" id="demo-container">
        <div class="gridPositioning">
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="BookNowCloseButton">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="SaveSettingsButton">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadGrid1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadPersistenceManager ID="RadPersistenceManager1" runat="server" StorageProviderKey="OverviewDemoStorage">
                <PersistenceSettings>
                    <telerik:PersistenceSetting ControlID="RadGrid1" />
                </PersistenceSettings>
            </telerik:RadPersistenceManager>
            <div class="gridHeader">
                <div></div>
                <telerik:RadButton RenderMode="Lightweight" ID="SaveSettingsButton" runat="server" Skin="" Text="Save"
                    CssClass="saveButton" OnClick="SaveSettingsButton_Click" />
                <telerik:RadButton RenderMode="Lightweight" ID="LoadSettingsButton" runat="server" Skin="" Text="Load"
                    CssClass="loadButton" OnClick="LoadSettingsButton_Click" />
            </div>
            <div>
                <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True"
                    AllowFilteringByColumn="True"
                    CellSpacing="0" GridLines="None">
                    <GroupingSettings CaseSensitive="false" />
                    <ClientSettings EnableRowHoverStyle="true" EnablePostBackOnRowClick="true">
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                        <Scrolling AllowScroll="true" UseStaticHeaders="true" ScrollHeight="" />
                    </ClientSettings>
                </telerik:RadGrid>
            </div>
            <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" runat="server" VisibleTitlebar="false" Modal="true" Width="550px" Height="380px"
                Behaviors="None" VisibleStatusbar="false">
                <ContentTemplate>
                    <asp:Panel ID="FirstStepPanel" runat="server">
                        <div class="bookNowFrame">
                            <div class="bookNowTitle">
                                Fill in the form to make your reservation
                            </div>
                            <hr class="lineSeparator" style="margin: 12px 0 12px 0" />
                            <table cellspacing="8">
                                <colgroup>
                                    <col width="90px" />
                                    <col width="150px" />
                                    <col />
                                    <col />
                                </colgroup>
                                <tr>
                                    <td>DATE OF RENT
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="DateOfRentPicker" Width="130px" runat="server" />
                                    </td>
                                    <td>RETURN DATE
                                    </td>
                                    <td>
                                        <telerik:RadDatePicker RenderMode="Lightweight" ID="ReturnDatePicker" Width="130px" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <hr class="lineSeparator" style="margin: 12px 0 12px 0" />
                            <table cellspacing="8">
                                <colgroup>
                                    <col width="90px" />
                                    <col />
                                </colgroup>
                                <tr>
                                    <td>FIRST NAME
                                    </td>
                                    <td>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="FirstNameTextBox" runat="server" Width="190px" /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>LAST NAME
                                    </td>
                                    <td>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="LastNameTextBox" runat="server" Width="190px" /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>EMAIL
                                    </td>
                                    <td>
                                        <telerik:RadTextBox RenderMode="Lightweight" ID="EmailTextBox" runat="server" Width="190px" /><br />
                                    </td>
                                </tr>
                            </table>
                            <hr class="lineSeparator" style="margin: 12px 0 15px 0" />
                            <telerik:RadButton RenderMode="Lightweight" ID="BookNowButton" runat="server" Text="Book Now"
                                Width="100px" OnClientClicking="bookNowClicking" UseSubmitBehavior="false" />
                            <telerik:RadButton RenderMode="Lightweight" ID="CancelButton" runat="server" Text="Cancel"
                                Width="100px" OnClientClicking="cancelClicking" UseSubmitBehavior="false" />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="SecondStepPanel" runat="server" Style="display: none; padding: 120px 20px 0 30px; width: 480px;">
                        <div style="float: left;">
                            <img src="Images/Confirmation.png" alt="Confirmation sign" />
                        </div>
                        <div style="float: left; padding: 10px 0 0 20px;">
                            <div class="bookNowComplete">
                                You have successfully made your reservation!
                            </div>
                            <hr class="lineSeparator" style="margin: 10px 10px 20px 0" />
                            <telerik:RadButton RenderMode="Lightweight" ID="BookNowCloseButton" runat="server" Text="Close"
                                Width="100px" OnClientClicking="bookNowCloseClicking" UseSubmitBehavior="false" />
                        </div>
                        <div style="clear: both">
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </telerik:RadWindow>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
                       SelectCommand="SELECT c.CustomerID, c.ContactName, c.Country, SUM(p.UnitPrice) AS allSpentMoney 
                FROM Products AS p, Orders AS o, [Order Details] AS od, Customers AS c 
                WHERE p.productID = od.productID AND od.OrderID = o.OrderID AND c.CustomerID = o.CustomerID 
                GROUP BY c.CustomerID, c.ContactName, c.Country"></asp:SqlDataSource>
    </form>
</body>
</html>