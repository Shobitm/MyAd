<%@ Page Title="" Language="C#" MasterPageFile="~/profile/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="profile_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="padding100">
        <div class="container">
            <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading panel-heading-custom">
                        <div class="panel-title">
                            Contact us</div>
                    </div>
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12">
                        </div>
                         <div class="panel-body">
                        <div id="signupform" class="form-horizontal" role="form">
                           
                            
                            <div class="form-group">
                                <label for="firstname" class="col-md-3 control-label">
                                    Name</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control"  ></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                     
                                       </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-md-3 control-label">Email</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control"></asp:TextBox>

                                    <br />
                                        <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="E-mail is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                                 
                                    <asp:RegularExpressionValidator ValidationGroup="val1" ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="You Must Enter The valid E-mail id" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                     
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-md-3 control-label">
                                    Subject</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="TextBox3" CssClass="form-control" ></asp:TextBox>
                                    <br />
                                     <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="Subject is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                     </div>
                                      </div>
                            </div>   
                            <div class="form-group">
                                <label for="confirm password" class="col-md-3 control-label">
                                    Message</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="TextBox4" CssClass="form-control" Height="193px" style="resize:none" TextMode="MultiLine" ></asp:TextBox>
&nbsp;&nbsp;
                                    <br />
                                     <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="Message is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                     </div>
                                     </div>
                            </div>                        
                            <div class="form-group">
                                <!-- Button -->
                                <div class="col-md-offset-3 col-md-9">                              
                                    <asp:Button ValidationGroup="val1" ID="Button1"  CssClass="btn btn-success" runat="server" Text="Send" Height="35px" Width="150px" OnClick="Button1_Click" />
                                    <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-danger" Height="35px" Width="150px" OnClick="Button2_Click" />
                                &nbsp;<br />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;<div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="padding-top: 15px; font-size: 85%">
                                        <a href="login.aspx"> &nbsp;</a></div>
                                </div>
                            <%--</div></div>--%>
                                    <asp:Label ID="Label1" CssClass="alert alert-success" runat="server"></asp:Label>
                                    <asp:Label ID="Label2" CssClass="alert alert-danger" runat="server"></asp:Label>
                            </div>
                        </div>
                &nbsp;&nbsp;
                </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
</asp:Content>

