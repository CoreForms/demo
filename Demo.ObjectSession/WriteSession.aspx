<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="WriteSession.aspx.cs" Inherits="Demo.ObjectSession._WriteSessionPage" %>

<html>

<body>
Write session test page
<form runat="server">
  <p>Id: <%= Session.SessionID %></p>
  <p>New session: <%= Session.IsNewSession%></p>
  <p>Read only: <%= Session.IsReadOnly%></p>
  <asp:Label runat="server" ID="TestLabel" Text="n/a"></asp:Label>
  <asp:Button runat="server" Text="Increment counter" OnClick="IncrementCounterNow" style="height: 26px"/>
  <asp:Button runat="server" Text="Increment counter (write - 3s delay)" OnClick="IncrementCounterBeforeDelay" style="height: 26px"/>
  <asp:Button runat="server" Text="Increment counter (3s delay - write)" OnClick="IncrementCounterAfterDelay" style="height: 26px"/>
</form>
</body>
</html>