<%@ Page Title="" Language="C#" MasterPageFile="~/ad.master" AutoEventWireup="true" CodeFile="forpass1.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container-fluid">
 <div class="padding100">
        <div class="container">
            <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading panel-heading-custom">
                        <div class="panel-title">
                            Change Password</div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12">
                        </div>
                        <div id="loginform" class="form-horizontal" role="form">
                            <div style="margin-bottom: 25px; top: 6px; left: 0px;" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i>
                                <asp:Label ID="Label1" runat="server" Text="New Password"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                                </span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="textbox1" CssClass="text-danger" ErrorMessage="Password is Required" ValidationGroup="val1" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div style="margin-bottom: 25px; top: 0px; left: 0px;" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i>
                                <asp:Label ID="Label2" runat="server" Text="Confirm Password"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                                </span>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="textbox2" CssClass="text-danger" ErrorMessage="Confirm Password" ValidationGroup="val1" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div style="margin-top: 10px" class="form-group">
                                <!-- Button -->
                                <div class="col-sm-12 controls">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Button1" ValidationGroup="val1" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="Button1_Click" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="Label3" runat="server"  CssClass="alert alert-success"></asp:Label>
                            &nbsp;
                                    <asp:Label ID="Label4" runat="server"  CssClass="alert alert-danger"></asp:Label>
                            <%--        <asp:Button ID="Button2" runat="server" Text="Confirm Password" CssClass="btn btn-warning" OnClick="Button2_Click" />--%>
                                &nbsp;&nbsp;&nbsp;
                                   <%-- <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Red"></asp:Label>--%>
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" runat="server" ControlToValidate="textbox1" CssClass="text-danger" ErrorMessage="Password Should be Minimum 6 Characters" ValidationExpression="^[\s\S]{6,}$" ValidationGroup="val1"></asp:RegularExpressionValidator>
                                &nbsp;<asp:CompareValidator ID="CompareValidator1" Display="Dynamic" runat="server" ControlToCompare="textbox1" ControlToValidate="textbox2" CssClass="text-danger" ErrorMessage="Both Password Must Be Same" ValidationGroup="val1"></asp:CompareValidator>
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

