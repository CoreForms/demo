using System.Threading.Tasks;
using CoreForms.Web.Infrastructure;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Demo.NetCore
{
  public class Startup
  {
    public void ConfigureServices(IServiceCollection services)
    {
      services.AddRouting();

      services.AddRazorPages();

      services.AddLegacyAspNet();
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }

      app.UseRouting();

      app.UseEndpoints(endpoints =>
      {
        endpoints.MapLegacyAspNet("{**rest}");
        endpoints.MapRazorPages();
        endpoints.MapGet("/", context =>
        {
          context.Response.Redirect("Default.aspx");
          return Task.CompletedTask;
        });
      });
    }
  }
}