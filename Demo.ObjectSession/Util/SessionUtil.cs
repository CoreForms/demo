using System;
using System.Web;
using System.Web.SessionState;

namespace Demo.ObjectSession.Util
{
    public static class SessionUtil
    {
        private const string c_counterName = "myCounter";

        public static string GetCounter(this HttpApplicationState state)
        {
            return (state[c_counterName] as int?)?.ToString() ?? "n/a";
        }

        public static string GetCounter (this HttpSessionState state)
        {
            return (state[c_counterName] as int?)?.ToString() ?? "n/a";
        }

        public static void IncrementCounter(this HttpApplicationState state)
        {
            var value = state[c_counterName] as int? ?? 0;
            state[c_counterName] = value + 1;
        }

        public static void IncrementCounter (this HttpSessionState state)
        {
            var value = state[c_counterName] as int? ?? 0;
            state[c_counterName] = value + 1;
        }
    }
}