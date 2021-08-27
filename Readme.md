<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128566644/14.2.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2398)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/CallbackErrorEvent/Default.aspx) (VB: [Default.aspx](./VB/CallbackErrorEvent/Default.aspx))
* [Default.aspx.cs](./CS/CallbackErrorEvent/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/CallbackErrorEvent/Default.aspx.vb))
* [ErrorPage.aspx](./CS/CallbackErrorEvent/ErrorPage.aspx) (VB: [ErrorPage.aspx](./VB/CallbackErrorEvent/ErrorPage.aspx))
* [ErrorPage.aspx.cs](./CS/CallbackErrorEvent/ErrorPage.aspx.cs) (VB: [ErrorPage.aspx.vb](./VB/CallbackErrorEvent/ErrorPage.aspx.vb))
* **[Global.asax](./CS/CallbackErrorEvent/Global.asax) (VB: [Global.asax](./VB/CallbackErrorEvent/Global.asax))**
* [Web.config](./CS/CallbackErrorEvent/Web.config) (VB: [Web.config](./VB/CallbackErrorEvent/Web.config))
<!-- default file list end -->
# How to handle app level errors occurred inside ASP.NET WebForms controls during callbacks
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e2398/)**
<!-- run online end -->


<p>This example illustrates how to catch and handle

* Exceptions that occur inside DevExpress ASP.NET controls during a callback using the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxWebControl_CallbackErrortopic">ASPxWebControl.CallbackError</a> event;
* The remaining unhandled exceptions using the <a href="http://msdn.microsoft.com/en-us/library/24395wz3(v=vs.100).aspx">Application_Error</a> event in the Global.asax file.<br>It also shows how to write required information to the same log/storage (for further diagnostics, etc).</p>
<p><br>Global.asax:<br><br></p>


```cs
void Application_Start(object sender, EventArgs e) {
    // Assign Application_Error as a callback error handler
    ASPxWebControl.CallbackError += new EventHandler(Application_Error);
}
```


<p> </p>


```vb
Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
	' Assign Application_Error as a callback error handler
	AddHandler ASPxWebControl.CallbackError, AddressOf Application_Error
End Sub
```


<p> </p>


```cs
void Application_Error(object sender, EventArgs e) {
    // Use HttpContext.Current to get a Web request processing helper
    Exception exception = HttpContext.Current.Server.GetLastError();
    if (exception is HttpUnhandledException)
        exception = exception.InnerException;
    // Log an exception
    AddToLog(exception.Message, exception.StackTrace);
}
```


<p> </p>


```vb
Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
	' Use HttpContext.Current to get a Web request processing helper
	Dim exception As Exception = HttpContext.Current.Server.GetLastError()
	If TypeOf exception Is HttpUnhandledException Then
		exception = exception.InnerException
	End If
	' Log an exception
	AddToLog(exception.Message, exception.StackTrace)
End Sub
```


<p><br>By default, an unhandled exception occurs while a callback is displayed using the "alert" message.<br>In order to execute redirect to a custom error page, specify the <a href="https://documentation.devexpress.com/#AspNet/CustomDocument6914">callbackErrorRedirectUrl</a> configuration option:<br><br>Web.config:<br><br></p>


```xml
<configuration>
    <devExpress>
        <errors callbackErrorRedirectUrl="~/ErrorPage.aspx"/>
    </devExpress>
</configuration>
```


<p><br><em>Note: some controls (for example ASPxUploadControl) utilize the capabilities of the DevExpress.Web.ASPxUploadProgressHttpHandler handler to perform actions on a callback. System-level exceptions (request timeout, session timeout, etc.) that occur while executing the DevExpress.Web.ASPxUploadProgressHttpHandler handler can't be handled using the ASPxWebControl.CallbackError event. Use the default Application_Error event handler for this purpose.</em><br><br><strong>MVC Version:</strong><br><a href="https://www.devexpress.com/Support/Center/p/E4588">How to use the ASPxWebControl.CallbackError event to handle application-level errors occurred inside ASPxWebControls during callback processing</a></p>

<br/>


