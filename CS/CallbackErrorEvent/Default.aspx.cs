using System;
using System.Web;
using System.Web.UI;

public partial class _Default: Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (HttpContext.Current.Session["Log"] == null)
            HttpContext.Current.Session["Log"] = "";
    }
    protected void CallbackControl_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
        Exception innerException = new Exception("NoReport");
        throw new Exception("This Exception is thrown to demonstrate the ASPxWebControl.CallbackError Event.", innerException);
    }
}