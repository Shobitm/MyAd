<%@ Page Title="" Language="C#" MasterPageFile="~/profile/MasterPage.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="indexprofile.aspx.cs" Inherits="profile_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
     <link href="css/w3.css" rel="stylesheet">
    <div id="banner">
        <div class="container">
            <h1>
                We cater your advertisement needs
                <br />
                
            </h1>
           
        </div>
    </div>

     <div class="padding100">
        <div class="container">
            <div class="row">
                        


                <table align="center" class="nav-justified">
                    <tr>
                        <td><asp:Button CssClass="btn btn-primary btn-lg" ID="Button1" runat="server"  Text="Profile" OnClick="Button1_Click" />
                 <asp:Button CssClass="btn btn-primary btn-lg" ID="Button2" runat="server"  Text="Request ad" OnClick="Button2_Click" />
                
                  <asp:Button CssClass="btn btn-primary btn-lg" ID="Button4" runat="server"  Text="View Ad Status" OnClick="Button4_Click" />
                   </td>
                        <td><iframe width="426" height="240" src="https://www.youtube.com/embed/RQtFp3wY0SQ" frameborder="0" allowfullscreen></iframe>
                </td>
                    </tr>
                </table>
                        


                
                </div>

            </div>
         </div>
    
</asp:Content>

