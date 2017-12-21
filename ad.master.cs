using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ad : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetCurrentPage();
    }
    private void SetCurrentPage()
    {
        var pageName = GetPageName();

        switch (pageName)
        {
            case "index.aspx":
                home.Attributes["class"] = "active";
                break;

            case "contact.aspx":
                contact1.Attributes["class"] = "active";
                break;
        }
    }
    private string GetPageName()
    {
        return Request.Url.ToString().Split('/').Last();
    }
}
