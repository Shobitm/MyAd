<%@ Page Title="" Language="C#" MasterPageFile="~/profile/MasterPage.master" AutoEventWireup="true" CodeFile="viewvideo.aspx.cs" Inherits="profile_Default3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            width: 500px;
            border: 3px solid #0DA9D0;
            padding: 0;
        }
        .modalPopup .header
        {
            background-color:#8f0505;
            height: 30px;
            color: White;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
        }
        .modalPopup .body
        {
            min-height: 50px;
            padding:5px;
            line-height: 30px;
            text-align: center;
            font-weight: bold;
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
                    
                    <div id="main-contact-form" style="height:360px; width:100%;"  >
                       
        <asp:DataList ID="dl" runat="server" OnSelectedIndexChanged="dl_SelectedIndexChanged" >
      <ItemTemplate>
             <table><tr><td><video controls height="360px" width="530px"><source src="<%# Eval("frmvideo") %>"/></video></td></tr></table>            
          </ItemTemplate>
     </asp:DataList>
                        <!--none-->
                
                    <asp:Label ID="youtubelabel" runat="server" Text=" Youtube Video:" Width="15%" CssClass="col-md-3 control-label"></asp:Label><asp:TextBox ID="TextBox1" runat="server" Width="50%" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                        <br />
                        <br />
                    <br />
                    <br />
<asp:Button ID="btnShow" runat="server" Text="Play Video" OnClientClick="return ShowModalPopup()" CssClass="btn btn-primary btn-lg" />
<asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server"
    PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID = "btnClose">
</ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
    <div class="header">
        Youtube Video
    </div>
    <div class="body">
        <iframe id = "video" width="420" height="315" frameborder="0"></iframe>
        <br />
        <br />
        <asp:Button ID="btnClose" runat="server" CssClass="btn btn-primary btn-lg" Text="Close" />
    </div>
    
</asp:Panel>
                   
    <script type="text/javascript">
        function ShowModalPopup() {
            var url = $get("<%=TextBox1.ClientID %>").value;
            url = url.split('v=')[1];
            $get("video").src = "//www.youtube.com/embed/" + url
            $find("mpe").show();
            return false;
        }
    </script>
                      <!--none-->
                        
                        <br />
                        </div>
                    <br /><br/>
                        <asp:Button ID="Button1" runat="server" Text="Approve" class="btn btn-primary btn-lg" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" runat="server" Text="Reject" class="btn btn-primary btn-lg" OnClick="Button2_Click" />
                        <asp:Button ID="Button3" runat="server" Text="Change Request" class="btn btn-primary btn-lg" OnClick="Button3_Click" />
                        <br />
                        <br />             
                    
                    <div style="margin-top:10px;">
                        <br />
                        
                        <asp:Label ID="Label1" runat="server" CssClass="alert alert-success"  Text="Label"></asp:Label>
                        <asp:Label ID="Label2" runat="server" CssClass="alert alert-danger" Text="Label"></asp:Label>
                        
                       
                    </div>
                   
                 
                   
            </div>
                    
        </div>
    </div></div>
</asp:Content>

