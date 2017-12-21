using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admindash_Default2 : System.Web.UI.Page
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
        string req_id = GridView1.SelectedRow.Cells[0].Text;
        //string message = "Row Index: " + index + "\\nName: " + name + "\\nCountry: " + country;
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + message + "');", true);
        //Session["links"] = GridView1.SelectedRow.Cells[3].Text;
        //Session["desc"] = GridView1.SelectedRow.Cells[4].Text;
        if (GridView1.SelectedRow.Cells[3].Text == "Accepted by Admin")
        {
            Response.Redirect("View1.aspx?rid=" + req_id);
        }
        else if (GridView1.SelectedRow.Cells[3].Text == "New" || GridView1.SelectedRow.Cells[3].Text == "Request Changed")
        {
            Response.Redirect("View2.aspx?rid=" + req_id);
        }
        else
        {
            Response.Redirect("View3.aspx?rid=" + req_id);
        }

    }

}