<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default2.aspx.cs" Inherits="Demo.ObjectSession._ReadOnlySessionPage" EnableSessionState="ReadOnly" %>

<html>

<body>
Read-only session test page
<form runat="server">
  <p>Id: <%= Session.SessionID %></p>
  <p>New session: <%= Session.IsNewSession%></p>
  <p>Read only: <%= Session.IsReadOnly%></p>
  <p>
    <asp:Label runat="server" ID="TestLabel" Text="n/a"></asp:Label>
  </p>
  <p>
    <asp:Button runat="server" Text="Show counter" OnClick="ShowCounterNow"/>
  </p>
  <p>
    <asp:Button runat="server" Text="Show counter (3s delay)" OnClick="ShowCounter"/>
  </p>
</form>
</body>
</html>