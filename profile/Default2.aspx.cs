using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class profile_Default2 : System.Web.UI.Page
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
       
        if (GridView1.SelectedRow.Cells[9].Text.Equals("Waiting Response"))
        {
            if (GridView1.SelectedRow.Cells[6].Text.Equals("Image"))
            {
                Session["frmcod"] = GridView1.SelectedRow.Cells[0].Text;
                Response.Redirect("viewimage.aspx");
            }
            else if (GridView1.SelectedRow.Cells[6].Text.Equals("Video"))
            {
                Session["frmcod"] = GridView1.SelectedRow.Cells[0].Text;
                Response.Redirect("viewvideo.aspx");
            }
            else 
            {
                Session["frmcod"] = GridView1.SelectedRow.Cells[0].Text;
                Response.Redirect("viewad.aspx");
            }
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("paygrid.aspx");
    }

}