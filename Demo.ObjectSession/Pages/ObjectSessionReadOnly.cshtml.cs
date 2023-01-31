using System;
using System.Threading.Tasks;
using CoreForms.Web.Infrastructure.Integration;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Demo.ObjectSession.Pages
{
    [RequireObjectSession]
    public class ObjectSessionModelReadOnly : PageModel
    {
        public string Id { get; set; }

        public bool IsNewSession { get; set; }

        public bool IsReadOnly { get; set; }

        public int? Value { get; set; }

        public async Task OnGet ([FromQuery] int delay = 0)
        {
            if (delay > 0)
                await Task.Delay(Math.Min(delay, 5000));

            var objectSession = HttpContext.Features.Get<IObjectSessionFeature>()?.Session;
            if (objectSession != null)
            {
                Id = objectSession.Id;
                IsNewSession = objectSession.IsNewSession;
                IsReadOnly = objectSession.IsReadOnly;

                Value = objectSession.Get ("myCounter") as int?;
            }
        }
    }
}