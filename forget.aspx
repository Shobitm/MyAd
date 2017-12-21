<%@ Page Title="" Language="C#" MasterPageFile="~/ad.master" AutoEventWireup="true" CodeFile="forget.aspx.cs" Inherits="Default2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="padding100">
        <div class="container">
            <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading panel-heading-custom">
                        <div class="panel-title">
                            Verify Your e-mail</div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12">
                            
                        </div>
                        <br />
                        <div id="loginform" class="form-horizontal" role="form">
                            <div style="margin-bottom: 25px; top: 1px; left: 0px;" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:Label ID="Label1" runat="server" Text="Enter Your  e-mail"></asp:Label>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator Display="Dynamic"  ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox1" ErrorMessage="E-mail is Required" CssClass="text-danger"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter The valid E-mail id" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" OnLoad="RegularExpressionValidator2_Load"></asp:RegularExpressionValidator>
                                
                                </span>
                                
                            </div>
                            <div style="margin-top: 10px" class="form-group">
                                <div class="col-sm-12 controls">
                                    
                                    <asp:Button  style="margin-left:80px" ID="Button1" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="Button1_Click" />
                 
                                    
                 <div><br/>
                                    <asp:Label ID="Label2" runat="server" CssClass="alert alert-danger"></asp:Label>
                                    <asp:Label ID="Label3" runat="server" CssClass="alert alert-success"></asp:Label>
                     </div>
                                </div>
                            </div>
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
</asp:Content>


