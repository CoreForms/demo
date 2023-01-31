using System;
using CoreForms.Web.Infrastructure;
using CoreForms.Web.Infrastructure.Integration;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Demo.ObjectSession
{
  public class Program
  {
    public static void Main ()
    {
      LegacyAspNetInitialization.License =
          "I hereby confirm that I use CoreForms only for trial purposes and have read and accept the CoreForms Trial License.";

      var legacyAspNetInitializationOptions = new LegacyAspNetInitializationOptions ("/legacy", Environment.CurrentDirectory);
      LegacyAspNetInitialization.Initialize (legacyAspNetInitializationOptions);

      var builder = WebApplication.CreateBuilder();

      builder.Services.AddRazorPages();
      builder.Services.AddLegacyAspNet();

      builder.Services.AddSession();
      builder.Services.AddInMemoryObjectSession();
      var app = builder.Build();

      if (app.Environment.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }

      app.UseSession();
      app.UseRouting();
      app.UseObjectSession();

      app.MapLegacyAspNet ("/legacy/{**rest}");
      app.MapRazorPages();


      app.Run();
    }
  }
}