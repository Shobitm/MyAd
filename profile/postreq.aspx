<%@ Page Title="" Language="C#" MasterPageFile="~/profile/MasterPage.master" AutoEventWireup="true" CodeFile="postreq.aspx.cs" Inherits="profile_Default" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <link href="css/owl/owl.carousel.css" rel="stylesheet" type="text/css" />
    <link href="css/owl/owl.theme.css" rel="stylesheet" type="text/css" />
    <link href="css/owl/owl.transitions.css" rel="stylesheet" type="text/css" />
    <!-- Custom CSS -->
    <link href="css/1-col-portfolio.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Ubuntu:300,400,700' rel='stylesheet'
        type='text/css'>
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400italic,700italic,400,700"
        rel="stylesheet" type="text/css" />
    <!-- Required plugin - Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.4.0/animate.min.css">
    <link href="fonts/font-awesome.min.css" rel="stylesheet" type="text/css" />
<body>
    
    <div id="banner">
        <div class="container">
            <h1>
               Please post your adverisements requirements and all details.
                <br />
             
            </h1>
            <h3>
               Note: Your Ad will be auto approved in 7 days.</h3>
        </div>
    </div>
    <div class="contact padding100">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div id="main-contact-form" class="contact-form">
                        <!-- form -->
                       <form role="form" class="form-horizontal" method="post">
                            <div style=" left:500px;">
                        <div class="form-group">
                            <label class="sr-only" for="contact-email">
                                title</label>
                            <asp:TextBox ID="title"  runat="server" CssClass="contact-name form-control" placeholder="Title....." ></asp:TextBox>                                
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="title" CssClass="text-danger" ErrorMessage="Title is Required" ValidationGroup="val1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                            
                        <div class="form-group">
                            <label class="sr-only" for="contact-email">
                                Required Time of Delivery</label></div>
                          <div class="form-group" style="float:left">  <asp:TextBox ID="rtd"   runat="server" CssClass="contact-name form-control"  placeholder="Required Time of Delivery..." OnTextChanged="rtd_TextChanged" ReadOnly="True" Width="700px" ></asp:TextBox>
                               
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="rtd" CssClass="text-danger" ErrorMessage="Date is Required" ValidationGroup="val1" Display="Dynamic"></asp:RequiredFieldValidator>

                          </div>
                            <div style="float:right"><asp:ImageButton ID="ImageButton1" runat="server" Height="32px" ImageUrl="~/profile/icons/ic_date_range_dark_18dp.png" onclick="ImageButton1_Click" Width="49px" CssClass="auto-style1" /></div>
                         <asp:Calendar ID="Calendar1" runat="server" onselectionchanged="Calendar1_SelectionChanged" SelectionMode="DayWeekMonth" Visible="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" TitleFormat="Month" Width="330px" OnDayRender="Calendar1_DayRender">
                             <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                             <DayStyle BackColor="#CCCCCC" />
                             <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                             <OtherMonthDayStyle ForeColor="#999999" />
                             <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                             <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                             <TodayDayStyle BackColor="#999999" ForeColor="White" />
        </asp:Calendar>
                                
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="contact-subject">
                                Ref. URLs</label>
                            <asp:TextBox ID="urls"  runat="server" CssClass="contact-name form-control" placeholder="Ref. URLs..." ></asp:TextBox>
                         <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator2" runat="server" ControlToValidate="urls" ErrorMessage="URL is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            
                            <label class="sr-only" for="contact-message">
                                Message</label>
                            <asp:TextBox ID="requirements" TextMode="MultiLine" runat="server" style="height: 150px" CssClass="contact-name form-control" placeholder="Detailed Description..." ></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="val1" ID="RequiredFieldValidator3" runat="server" ControlToValidate="requirements" ErrorMessage="Requirements is Required" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                               <div class="form-group">
                               <label class="sr-only" for="contact-message">
                                Required Contents</label>
                               <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" >
                                      <asp:ListItem Text="-------Select Req. Contents-------" Value=""></asp:ListItem>
                                      <asp:ListItem>Image</asp:ListItem>
                                      <asp:ListItem>Video</asp:ListItem>
                                      <asp:ListItem>Image and Video</asp:ListItem>
                               </asp:DropDownList>
                           </div>
                                <asp:Button ID="Button1" ValidationGroup="val1" runat="server" Text="Submit Details" class="btn btn-success" Height="50px" Width="205px" OnClick="Button1_Click" />
                           <asp:Button ID="Button2" runat="server" Text="Cancel" CssClass="btn btn-danger" Height="50px" Width="205px" OnClick="Button2_Click" />                        
                        </form>
                        <!-- ./form -->
                    </div>
                </div>
                <div class="col-md-4">
                </div>
            </div>
        </div>
    </div>
    </body>


</asp:Content>

