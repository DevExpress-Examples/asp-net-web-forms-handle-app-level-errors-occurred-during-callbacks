using System;
using System.Web;

public partial class Default2: System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if (HttpContext.Current.Session["Log"] != null)
            Memo.Text = HttpContext.Current.Session["Log"].ToString();
    }
    protected void ClearLinkButton_Click(object sender, EventArgs e) {
        HttpContext.Current.Session["Log"] = "";
        Memo.Text = "";
    }
}