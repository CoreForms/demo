<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="AppSession.aspx.cs" Inherits="Demo.ObjectSession._AppSession" %>

<html>

<body>
Read-only session test page
<form runat="server">
  <asp:Label runat="server" ID="TestLabel" Text="n/a"></asp:Label>
  <asp:Button runat="server" Text="Show counter" OnClick="ShowCounter" style="height: 26px"/>
  <asp:Button runat="server" Text="Increment counter" OnClick="IncrementCounter" style="height: 26px"/>
</form>
</body>
</html>