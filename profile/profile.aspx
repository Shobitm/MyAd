<%@ Page Title="" Language="C#" MasterPageFile="~/profile/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            display: block;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="padding100">
        <div class="container">
            <div id="loginbox" style="margin-top: 50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading panel-heading-custom">
                        <div class="panel-title">
                            Profile Form</div>
                    </div>
                    <div style="padding-top: 10px" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12">
                        </div>
                         <div class="panel-body">
                        <div id="ProfileForm" class="form-horizontal" role="form">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="panel-label"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" runat="server"  CssClass="alert alert-success "></asp:Label>
                              <br />
                            </div>
                            <div class="form-group">
                                <br />
                                <br />
                                <label for="firstname" class="col-md-3 control-label">
                                    First Name</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtf_name" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtf_name" ErrorMessage="First Name is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                     </div>
                            </div>
                            <div class="form-group">
                                <label for="lastname" class="col-md-3 control-label">
                                    Last Name</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtl_name" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                               <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtl_name" ErrorMessage="Last Name is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                     </div>
                            </div>
                            <div class="form-group">
                                <label for="contact no" class="col-md-3 control-label">
                                    Contact Number</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="contact" CssClass="form-control" placeholder="Contact number" ReadOnly="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator3" runat="server" ControlToValidate="contact" ErrorMessage="Contact Number is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                   
                                    <asp:RegularExpressionValidator ValidationGroup="val1" ID="RegularExpressionValidator2" runat="server" ControlToValidate="contact" ErrorMessage="Please Enter Correct Phone No."  CssClass="text-danger" ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <br />
                                     </div>
                            </div>
                             <div class="form-group">
                                <label for="address" class="col-md-3 control-label">
                                    Address</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtaddress" CssClass="auto-style1" style="resize:none" placeholder="Address" Height="238px" TextMode="MultiLine" Width="347px"></asp:TextBox>
                                <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtaddress" ErrorMessage="Address is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-md-3 control-label">
                                    Email</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtemail" CssClass="form-control" placeholder="Email Address" ReadOnly="True"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <br />
                                     
                                     </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-md-3 control-label">
                                    Password</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="txtpassword" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                               <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtpassword" ErrorMessage="Password is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                                    
                                    <asp:RegularExpressionValidator ValidationGroup="val1" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpassword" CssClass="text-danger" ValidationExpression = "^[\s\S]{6,}$" ErrorMessage="Password Should be Minimum 6 Characters" Display="Dynamic"></asp:RegularExpressionValidator>
                                      
                                      </div>
                            </div>   
                            <div class="form-group">
                                <label for="confirm password" class="col-md-3 control-label">
                                    Confirm Password</label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="cpassword" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                               <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator7" runat="server" ControlToValidate="cpassword" ErrorMessage="Confirm your Password" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                                 
                                    <asp:CompareValidator ValidationGroup="val1" ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="cpassword" ErrorMessage="Both Password Must Be Same" CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
                                     
                                      </div>
                            </div>                        
                            <div class="form-group">
                                <!-- Button -->
                                <div class="col-md-offset-3 col-md-9">                              
                                    <asp:Button ValidationGroup="val1" ID="Button1"  CssClass="btn btn-success" runat="server" Text="Update" Height="35px" Width="150px" OnClick="Button1_Click"  />
                                    <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-danger"  Height="35px" Width="150px" OnClick="Button2_Click"  />
                                
                                    
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

