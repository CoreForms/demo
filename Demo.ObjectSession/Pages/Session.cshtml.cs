using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Demo.ObjectSession.Pages
{
    public class SessionModel : PageModel
    {
        public string Id { get; set; }

        public int? Value { get; set; }

        public async Task OnGet ([FromQuery] int delay = 0)
        {
            if (delay > 0)
                await Task.Delay (Math.Min (delay, 5000));

            var session = HttpContext.Features.Get<ISessionFeature>()?.Session;
            if (session != null)
            {
                Id = session.Id;

                Value = session.GetInt32 ("myCounter");
            }
        }

        public async Task OnPost ([FromForm] int delay = 0)
        {
            if (delay > 0)
                await Task.Delay (Math.Min (delay, 5000));

            var session = HttpContext.Features.Get<ISessionFeature>()?.Session;
            if (session != null)
            {
                Id = session.Id;

                Value = session.GetInt32 ("myCounter");
                Value ??= 0;
                Value++;

                session.SetInt32 ("myCounter", Value.Value);
            }
        }
    }
}