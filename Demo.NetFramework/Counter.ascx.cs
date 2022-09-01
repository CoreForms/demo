using System;
using System.Web.UI;

namespace Demo.NetFramework
{
  public partial class Counter : UserControl
  {
    public int Count
    {
      get => ViewState[nameof(Count)] as int? ?? 0;
      set => ViewState[nameof(Count)] = value;
    }

    protected void Decrease(object sender, EventArgs e)
    {
      Count--;
    }

    protected void Increase(object sender, EventArgs e)
    {
      Count++;
    }
  }
}