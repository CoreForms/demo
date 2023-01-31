using System;
using System.Threading.Tasks;
using CoreForms.Web.Infrastructure;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Demo.NetCore
{
  public static class Program
  {
    public static void Main()
    {
      LegacyAspNetInitialization.License =
        "I hereby confirm that I use CoreForms only for trial purposes and have read and accept the CoreForms Trial License.";

      var legacyAspNetInitializationOptions = new LegacyAspNetInitializationOptions("/", Environment.CurrentDirectory);
      LegacyAspNetInitialization.Initialize(legacyAspNetInitializationOptions);

      var builder = WebApplication.CreateBuilder();

      builder.Services.AddRazorPages();
      builder.Services.AddLegacyAspNet();

      var app = builder.Build();

      if (app.Environment.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }

      app.MapLegacyAspNet("{**rest}");
      app.MapRazorPages();
      app.MapGet("/", context =>
      {
        context.Response.Redirect("Default.aspx");
        return Task.CompletedTask;
      });

      app.Run();
    }
  }
}