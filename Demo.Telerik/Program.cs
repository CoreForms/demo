using System;
using CoreForms.Web.Infrastructure;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace Demo.Telerik
{
  public class Program
  {
    public static void Main (string[] args)
    {
      LegacyAspNetInitialization.License = "I hereby confirm that I use CoreForms only for trial purposes and have read and accept the CoreForms Trial License.";

      Console.WriteLine (AppDomain.CurrentDomain.BaseDirectory);
      LegacyAspNetInitialization.Initialize(new LegacyAspNetInitializationOptions("/", Environment.CurrentDirectory));

      CreateHostBuilder (args).Build().Run();
    }

    public static IHostBuilder CreateHostBuilder (string[] args)
    {
      return Host.CreateDefaultBuilder (args)
          .ConfigureWebHostDefaults (
              webBuilder => { webBuilder.UseStartup<Startup>(); });
    }
  }
}