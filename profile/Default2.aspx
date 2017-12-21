<%@ Page Title="" Language="C#" MasterPageFile="~/profile/MasterPage.master" AutoEventWireup="true"  EnableEventValidation = "false"  CodeFile="Default2.aspx.cs" Inherits="profile_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 66.66666667%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }  
        
    </style>
    <style type="text/css">
        #ContentPlaceHolder1_GridView1 tr.rowHover:hover{
          
            font-weight:bold;
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div id="banner">
        <div class="container">
            <h1>
               
                All Your requested, accepted and pending ads at one place.
            </h1>
            <h3>
                </h3>
        </div>
    </div>
    <div style=""> </br> </div>
    <div style="height: 30px; line-height: 30px; padding: 0;">

    </div>
     <div class="contact padding100">
        <div class="container">
            <div class="row">
                <div class="auto-style1">
                    <div id="main-contact-form" class="contact-form">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myad5ConnectionString %>" SelectCommand="getreks" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="uid" SessionField="cod" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <!-- form -->
                        <form role="form" class="form-horizontal" method="post">
                            <div style=" left:500px;">
                                <asp:GridView ID="GridView1" runat="server" RowStyle-CssClass="rowHover" style="margin-top:0px" AllowPaging="True"  OnRowDataBound="OnRowDataBound"
    OnSelectedIndexChanged="OnSelectedIndexChanged" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="frmcod" DataSourceID="SqlDataSource1" align="center" Width="130%" CellPadding="4" PageSize="5" ForeColor="#333333">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="frmcod"  HeaderText="Ad. code" SortExpression="frmcod" InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="frmregcod" Visible="false" HeaderText="frmregcod" SortExpression="frmregcod" />
                                        
                                        <asp:TemplateField HeaderText="Title">
                    <ItemTemplate>
                        <div style="width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                            <%# Eval("frmtit") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                                        <asp:BoundField DataField="frmdate" HeaderText="Last Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="frmdate" />
                                       
                                        <asp:TemplateField HeaderText="Ref. Url's">
                    <ItemTemplate>
                        <div style="width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                            <%# Eval("frmurl") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>

                                       
                                        <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <div style="width: 100px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                            <%# Eval("frmdesc") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                                        <asp:BoundField DataField="frmreqcont" HeaderText="Status" SortExpression="frmreqcont" />
                                        
                                        <asp:BoundField DataField="frmimg" Visible="false" HeaderText="frmimg" SortExpression="frmimg" />
                                        <asp:BoundField DataField="frmvideo" Visible="false" HeaderText="frmvideo" SortExpression="frmvideo" />
                                        <asp:BoundField DataField="frmstatus" HeaderText="Status" SortExpression="frmstatus" />
                                    
                                    </Columns>
                                    <EmptyDataRowStyle HorizontalAlign="Center" />
                                    <EmptyDataTemplate >
                                        NO RECORDS FOUND
                                    </EmptyDataTemplate>
                                    <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                                <div style="align-items:center;">
                                   
                                </div>
                                <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                        </form>
                        <!-- ./form -->
                       
                    </div>
                </div>
                <div class="col-md-4">
                </div>
            </div>
        </div>
    </div>









</asp:Content>

