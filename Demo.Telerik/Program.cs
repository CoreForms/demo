using System;
using CoreForms.Web.Infrastructure;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Demo.Telerik
{
  public class Program
  {
    public static void Main (string[] args)
    {
      LegacyAspNetInitialization.License =
          "I hereby confirm that I use CoreForms only for trial purposes and have read and accept the CoreForms Trial License.";

      Console.WriteLine (AppDomain.CurrentDomain.BaseDirectory);
      LegacyAspNetInitialization.Initialize(new LegacyAspNetInitializationOptions("/", Environment.CurrentDirectory));

      var builder = WebApplication.CreateBuilder();

      builder.Services.AddRazorPages();
      builder.Services.AddLegacyAspNet();

      var app = builder.Build();

      if (app.Environment.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }

      app.MapLegacyAspNet ("{**rest}");
      app.MapRazorPages();

      app.Run();
    }
  }
}