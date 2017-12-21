<%@ Page Title="" Language="C#" MasterPageFile="~/ad.master"
    AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="preview_dotnet_templates_akshara_multi_master_login" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="padding100">
        <div class="container">
            <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading panel-heading-custom">
                        <div class="panel-title">
                            Sign In</div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12">
                        </div>
                        <div id="loginform" class="form-horizontal" role="form">
                            <div style="margin-bottom: 5px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <asp:TextBox runat="server" ID="username" CssClass="form-control" placeholder="username or email"></asp:TextBox>
                          </div>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator5" runat="server" ControlToValidate="username" ErrorMessage="E-mail is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                                    &nbsp;<asp:RegularExpressionValidator ValidationGroup="val1" ID="RegularExpressionValidator1" runat="server" ControlToValidate="username" ErrorMessage="You Must Enter The valid E-mail id" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    
            <br>
                            <div style="margin-bottom:5px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <asp:TextBox runat="server" ID="password" CssClass="form-control" placeholder="password"
                                    TextMode="Password"></asp:TextBox>
                                 
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="val1" runat="server" ControlToValidate="password" ErrorMessage="Please Enter Password" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="input-group">
                                <div class="checkbox">
                                    <label class="checkbox-inline">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember me" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                    </label>
                                </div>
                            </div>
                            <div style="margin-top: 10px" class="form-group">
                                <!-- Button -->
                                <div class="col-sm-12 controls">
                                    <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-success" ValidationGroup="val1" OnClick="Button1_Click" />
                                    <asp:Button ID="Button2" runat="server" Text="Forgot Password" CssClass="btn btn-warning" OnClick="Button2_Click" />
                                &nbsp;&nbsp;
                                    <asp:Label ID="Label1" runat="server" CssClass="alert alert-danger"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="padding-top: 15px; font-size: 85%">
                                        Don't have an account! <a href="signup.aspx"> Sign Up Here </a>
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
