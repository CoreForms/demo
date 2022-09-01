<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Demo.NetCore._Default" %>
<%@ Register TagPrefix="demo" TagName="Counter" Src="Counter.ascx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Counter (Post-back controls)</h2>
    <p>
        A simple counter as a control that works with post-backs:
    </p>
    <demo:Counter runat="server"></demo:Counter>

    <h2>Getting time (Async postback using update panel)</h2>
    <p>
        Get the current time without refreshing:
    </p>

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <p>
                <%= DateTime.UtcNow.ToLongTimeString() %>
            </p>
            <asp:Button runat="server" Text="Show current time" ID="UpdateTimeButton" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>