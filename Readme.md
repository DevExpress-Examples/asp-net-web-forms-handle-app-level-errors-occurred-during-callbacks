<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128566644/14.2.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2398)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->

# ASP.NET Web Forms - How to handle application-level errors occurred during callbacks
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128566644/)**
<!-- run online end -->

Use the static [ASPxWebControl.CallbackError](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxWebControl.CallbackError) event to handle callback exceptions thrown by DevExpress web controls server side. Delegate callback exception handling to the `Application_Error` event handler.

```cs
void Application_Start(object sender, EventArgs e) {
    // Assign Application_Error as a callback error handler
    ASPxWebControl.CallbackError += new EventHandler(Application_Error);
}
```

```vb
Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
	' Assign Application_Error as a callback error handler
	AddHandler ASPxWebControl.CallbackError, AddressOf Application_Error
End Sub
```

The `Application_Error` event handler catches all unhandled ASP.NET errors while processing a request. You can use the [GetLastError](https://learn.microsoft.com/en-us/dotnet/api/system.web.httpserverutility.getlasterror) method to get and log the details of the last exception.

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

When a callback exception occurs, you can redirect the application to another web resource. Use the [callbackErrorRedirectUrl](https://docs.devexpress.com/AspNet/6914/common-concepts/webconfig-modifications/webconfig-options/redirection-on-a-callback-error) configuration option to specify the redirection location.

```xml
<configuration>
    <devExpress>
        <errors callbackErrorRedirectUrl="~/ErrorPage.aspx"/>
    </devExpress>
</configuration>
```


> Note
> 
> There are controls (for instance, [ASPxUploadControl](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxUploadControl)) that utilize the capabilities of the [DevExpress.Web.ASPxUploadProgressHttpHandler](https://docs.devexpress.com/AspNet/6774/common-concepts/webconfig-modifications/aspxuploadprogresshttphandler) handler to perform actions on a callback. System-level exceptions (request timeout, session timeout, etc.) that occur while executing the `ASPxUploadProgressHttpHandler` handler cannot be handled using the `ASPxWebControl.CallbackError` event. Use the default `Application_Error` event handler for this purpose.


## Files to Review

* [Global.asax](./CS/CallbackErrorEvent/Global.asax) (VB: [Global.asax](./VB/CallbackErrorEvent/Global.asax))
* [Web.config](./CS/CallbackErrorEvent/Web.config) (VB: [Web.config](./VB/CallbackErrorEvent/Web.config))

## Documentation 

* [Callbacks](https://docs.devexpress.com/AspNet/402559/common-concepts/callbacks)

## More Examples 

* [ASP.NET MVC - How to handle application-level errors that occurred during callbacks](https://github.com/DevExpress-Examples/how-to-handle-app-level-errors-occurred-inside-aspnet-mvc-controls-during-callbacks-e4588)
