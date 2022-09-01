# CoreForms.Web Demonstration

This repo contains a demonstration of an ASP.NET Web Forms project using CoreForms.Web running under .NET 6. CoreForms.Web is licensed using a trial license. You can find the Nuget packages with the license on the re-motion Nuget package feed (https://nuget.re-motion.org/feeds/re-motion-release/).

The `Demo.NetFramework` projects contains a sample ASP.NET WebForms application written using .NET Framework. It uses the following WebForms features:

- ASPX Page
- ASMX Control
- Site Master
- Postback
- Async Postback

The `Demo.NetCore` project contains the same application but it is running under .NET 6 using CoreForms.Web. The project contains the default ASP.NET Core setup using a `Startup` class. CoreForms.Web is initialized in `Program` and then requests are executed using a custom middleware registered in `Startup`.