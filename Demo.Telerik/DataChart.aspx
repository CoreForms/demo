<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Telerik2.aspx.cs" Inherits="Demo.Telerik.DataChart" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat="server">
    <title>Telerik ASP.NET Example</title>
    <link href="styles2.css" rel="stylesheet" />
</head>
 
<body>
    <p>
        This demo was adapted from <a href="https://demos.telerik.com/aspnet-ajax/htmlchart">https://demos.telerik.com/aspnet-ajax/htmlchart</a>
    </p>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <div class="demo-containers">
        <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1" LoadingPanelID="RadAjaxLoadingPanel1">
            <div class="demo-container no-bg ">
                <div class="gridTitle">Customers</div>
                <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False"
                    OnPreRender="RadGrid1_PreRender" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged"
                    Width="392px" Height="340px" GridLines="None" AllowMultiRowSelection="false"
                    PageSize="3" AllowPaging="true">
                    <MasterTableView DataSourceID="SqlDataSource1" Height="340px" DataKeyNames="CustomerID">
                        <Columns>
                            <telerik:GridBoundColumn DataField="CustomerID" UniqueName="CustomerID" HeaderText="CustomerID"
                                EmptyDataText="&amp;nbsp;" Visible="false">
                                    <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ContactName" UniqueName="ContactName" HeaderText="Name"
                                EmptyDataText="&amp;nbsp;" HeaderStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Country" UniqueName="Country" HeaderText="Country"
                                EmptyDataText="&amp;nbsp;" HeaderStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="allSpentMoney" UniqueName="allSpentMoney" HeaderText="Spent Money"
                                EmptyDataText="&amp;nbsp;" HeaderStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                        </Columns>
                        <RowIndicatorColumn>
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn>
                            <HeaderStyle Width="20px"></HeaderStyle>
                        </ExpandCollapseColumn>
                    </MasterTableView>
                    <FilterMenu EnableTheming="True">
                        <CollapseAnimation Duration="200" Type="OutQuint"></CollapseAnimation>
                    </FilterMenu>
                    <ClientSettings EnablePostBackOnRowClick="true">
                        <Selecting AllowRowSelect="true"></Selecting>
                    </ClientSettings>
                    <PagerStyle Mode="NumericPages"></PagerStyle>
                    <HeaderStyle Height="52px"></HeaderStyle>
                </telerik:RadGrid>
            </div>
 
            <div class="demo-container no-bg size-medium">
                <telerik:RadHtmlChart runat="server" ID="RadHtmlChart1" DataSourceID="SqlDataSource2" Width="600px" Height="400px">
                    <PlotArea>
                        <Series>
                            <telerik:BarSeries Name="Products" DataFieldY="spentMoney">
                                <TooltipsAppearance Color="White" DataFormatString="${0}"></TooltipsAppearance>
                                <LabelsAppearance Visible="false">
                                </LabelsAppearance>
                            </telerik:BarSeries>
                        </Series>
                        <XAxis DataLabelsField="pName">
                            <MinorGridLines Visible="false"></MinorGridLines>
                            <MajorGridLines Visible="false"></MajorGridLines>
                        </XAxis>
                        <YAxis>
                            <LabelsAppearance DataFormatString="${0}"></LabelsAppearance>
                            <MinorGridLines Visible="false"></MinorGridLines>
                        </YAxis>
                    </PlotArea>
                    <Legend>
                        <Appearance Visible="false"></Appearance>
                    </Legend>
                    <ChartTitle Text="Money Spent Per Product"></ChartTitle>
                </telerik:RadHtmlChart>
            </div>
 
        </telerik:RadAjaxPanel>
    </div>
 
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1">
    </telerik:RadAjaxLoadingPanel>
 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        SelectCommand="SELECT top 12 c.CustomerID, c.ContactName, c.Country, SUM(p.UnitPrice) AS allSpentMoney 
                FROM Products AS p, Orders AS o, [Order Details] AS od, Customers AS c 
                WHERE p.productID = od.productID AND od.OrderID = o.OrderID AND c.CustomerID = o.CustomerID 
                GROUP BY c.CustomerID, c.ContactName, c.Country"></asp:SqlDataSource>
 
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        SelectCommand="SELECT p.productId, p.ProductName AS pName, sum(p.UnitPrice) AS spentMoney, c.CustomerID AS cID, c.ContactName AS cName 
                FROM products AS p, orders AS o, [order details] AS od, customers AS c 
                WHERE p.productID = od.productID AND od.OrderID = o.OrderID AND c.CustomerID = o.CustomerID AND (c.CustomerID = @CustomerID)
                GROUP BY c.CustomerID, c.ContactName, p.productID, p.ProductName">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadGrid1" Name="CustomerID" DefaultValue="ALFKI"
                PropertyName="SelectedValue"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>