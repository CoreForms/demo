using System;
using CoreForms.Web.Infrastructure;
using Microsoft.AspNetCore.Hosting;
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

      CreateHostBuilder().Build().Run();
    }

    public static IHostBuilder CreateHostBuilder()
    {
      return Host.CreateDefaultBuilder()
        .ConfigureWebHostDefaults(webBuilder => { webBuilder.UseStartup<Startup>(); });
    }
  }
}