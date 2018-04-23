<%@ Application Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="DevExpress.Web" %>

<script RunAt="server">
    void Application_Start(object sender, EventArgs e) {
        // Assign Application_Error as a callback error handler
        ASPxWebControl.CallbackError += new EventHandler(Application_Error);
    }

    void Application_Error(object sender, EventArgs e) {
        // Use HttpContext.Current to get a Web request processing helper
        HttpServerUtility server = HttpContext.Current.Server;
        Exception exception = server.GetLastError();
        if (exception is HttpUnhandledException)
            exception = exception.InnerException;
        // Log an exception
        AddToLog(exception.Message, exception.StackTrace);
    }

    void AddToLog(string message, string stackTrace) {
        StringBuilder sb = new StringBuilder();
        sb.AppendLine(DateTime.Now.ToLocalTime().ToString());
        sb.AppendLine(message);
        sb.AppendLine();
        sb.AppendLine("Source File: " + HttpContext.Current.Request.RawUrl);
        sb.AppendLine();
        sb.AppendLine("Stack Trace: ");
        sb.AppendLine(stackTrace);
        for (int i = 0; i < 150; i++)
            sb.Append("-");
        sb.AppendLine();
        HttpContext.Current.Session["Log"] += sb.ToString();
        sb.AppendLine();
    }
</script>