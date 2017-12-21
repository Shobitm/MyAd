using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admindash_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["style"] = "cursor:pointer";
        }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        //int index = GridView1.SelectedRow.RowIndex;
        //string name = GridView1.SelectedRow.Cells[0].Text;
        string reg_id = GridView1.SelectedRow.Cells[0].Text;
        //string message = "Row Index: " + index + "\\nName: " + name + "\\nCountry: " + country;
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
        Response.Redirect("User.aspx?uid=" + reg_id);
    }





}