<%@ Control Language="C#" CodeBehind="Counter.ascx.cs" Inherits="Demo.NetFramework.Counter" %>

<asp:Label runat="server"><%= Count %></asp:Label>
<asp:Button runat="server" Text="Decrease" OnClick="Decrease"/>
<asp:Button runat="server" Text="Increase" OnClick="Increase"/>