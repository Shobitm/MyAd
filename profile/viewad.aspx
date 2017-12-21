<%@ Page Title="" Language="C#" MasterPageFile="~/profile/MasterPage.master" MaintainScrollPositionOnPostback="true"  AutoEventWireup="true" CodeFile="viewad.aspx.cs" Inherits="profile_Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
          
       
      
        <link href="css/w3.css" rel="stylesheet">
    <div id="banner">
        <div class="container">
            <h1>
                We cater your advertisement needs
                <br /></h1>
                
                     <h3><span id="countdown" class="timer"></span></h3>
            
           
        </div>
    </div>
        
         
    <div class="contact padding100">
        <div class="container">
            <span CssClass="alert alert-success" id="countdown" class="timer"></span>
            <script type="text/javascript">
                            var upgradeTime = '<%=diffInSeconds%>';
                            var seconds = upgradeTime;
                            function timer() {
                                var days = Math.floor(seconds / 24 / 60 / 60);
                                var hoursLeft = Math.floor((seconds) - (days * 86400));
                                var hours = Math.floor(hoursLeft / 3600);
                                var minutesLeft = Math.floor((hoursLeft) - (hours * 3600));
                                var minutes = Math.floor(minutesLeft / 60);
                                var remainingSeconds = seconds % 60;
                                if (remainingSeconds < 10) {
                                    remainingSeconds = "0" + remainingSeconds;
                                }
                                document.getElementById('countdown').innerHTML = "Respond before " + days + " Days " + hours + " Hours " + minutes + " Minutes " + remainingSeconds + " Seconds or the Ad will be Auto-Approved";
                                
                                if (seconds == 0) {
                                    clearInterval(countdownTimer);
                                    document.getElementById('countdown').innerHTML = "";
                                } else {
                                    seconds--;
                                }
                            }
                            var countdownTimer = setInterval('timer()', 1000);
                        </script>
            <div class="row">
                <div class="row-md-8">
                    
                    <div id="main-contact-form" style="height:360px; width:550px;float:left;" class="w3-panel w3-light-grey w3-border">
                       
        <asp:DataList ID="dl" runat="server" OnSelectedIndexChanged="dl_SelectedIndexChanged" >
      <ItemTemplate>
             <table><tr><td><img src="<%#Eval("frmimg") %>" height="360px" width="530px" /></td></tr></table>              
          </ItemTemplate>
     </asp:DataList>
                        <br />
    <%--</div>--%>
           </div>
                    <div id="main-contact-form1" style="height:360px; width:550px; float:right;" class="w3-panel w3-light-grey w3-border">
                        <!--video-->
                       
                        <asp:DataList ID="dl2" runat="server" >
      <ItemTemplate>
             <table><tr><td><video controls height="360px" width="530px"><source src="<%# Eval("frmvideo") %>"/></video></td></tr></table>              
          </ItemTemplate>
     </asp:DataList>
                                
                        <!--end video-->
                        <br />
                    </div>
                      
                    <div style="" >
                        <asp:Button ID="Button1" runat="server" Text="Approve" class="btn btn-primary btn-lg" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Reject" class="btn btn-primary btn-lg" OnClick="Button2_Click" />
                        <asp:Button ID="Button3" runat="server" Text="Change Request" class="btn btn-primary btn-lg" OnClick="Button3_Click" />
                        <br />
                        <br />             
                    </div>
                    <div style="margin-top:10px;">
                        <br />
                        
                        <asp:Label ID="Label1" runat="server" CssClass="alert alert-success"  Text="Label"></asp:Label>
                        <asp:Label ID="Label2" runat="server" CssClass="alert alert-danger" Text="Label"></asp:Label>
                        
                       
                    </div>
                   
                 
                   
            </div>
                    
        </div>
    </div></div>

</asp:Content>

