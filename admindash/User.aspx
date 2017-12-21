<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" MasterPageFile="~/admindash/MasterPage.master" Inherits="admindash_Default3" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>User Information:</h2>
        </div>
    </div>
    <!-- /. ROW  -->
    <hr />
    <br />

    <div>
        
        

        
        <div class="center-div2">
            <td colspan="2">
                <div style="float: left; width: 80px">
                    <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                </div>
                <div style="float: none; width: 600px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="gr" ControlToValidate="TextBox1" ErrorMessage="First Name cannot be left empty" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="clear: both">
                    <br />
                </div>

                <div style="float: left; width: 80px">
                    <asp:Label ID="Label2" runat="server" Text="Last Name:"></asp:Label>
                </div>
                <div style="float: none; width: 600px">
                    <asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="gr" ControlToValidate="TextBox2" ErrorMessage="Last Name cannot be left empty" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="clear: both">
                    <br />
                </div>

                <div style="float: left; width: 80px">
                    <asp:Label ID="Label3" runat="server" Text="Email ID:"></asp:Label>
                </div>
                <div style="float: none; width: 600px">
                    <asp:TextBox ID="TextBox3" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="gr" ControlToValidate="TextBox3" ErrorMessage="Email ID cannot be left empty" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="clear: both">
                    <br />
                </div>

                <div style="float: left; width: 80px">
                    <asp:Label ID="Label4" runat="server" Text="Contact No:"></asp:Label>
                </div>
                <div style="float: none; width: 600px">
                    <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="gr" ControlToValidate="TextBox4" ErrorMessage="Contact No cannot be left empty" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="clear: both">
                    <br />
                </div>

                <div style="float: left; width: 80px">
                    <asp:Label ID="Label5" runat="server" Text="Address:"></asp:Label>
                </div>
                <div style="float: none; width: 600px">
                    <asp:TextBox ID="TextBox5" runat="server" Width="200px" Height="200px" TextMode="MultiLine" Style="resize: none"></asp:TextBox>
                </div>
                <div style="clear: both">
                    <br />
                </div>

                <div style="float: left; width: 80px">
                    <asp:Label ID="Label6" runat="server" Text="Password:"></asp:Label>
                </div>
                <div style="float: none; width: 600px">
                    <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="gr" ControlToValidate="TextBox6" ErrorMessage="Password cannot be left empty" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div style="clear: both">
                    <br />
                </div>

                <div style="float: left; width: 80px">
                    <asp:Label ID="Label7" runat="server" Text="Account Status:"></asp:Label>
                </div>
                <div style="float: none; width: 600px">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="Active">Active</asp:ListItem>
                        <asp:ListItem Value="Blocked">Blocked</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div style="clear: both">
                    <br />
                </div>
                <div style="float: left;">
                    <asp:Button ID="Button1" runat="server" ValidationGroup="gr" Text="Update" OnClick="Button1_Click" />

                    &nbsp;&nbsp;&nbsp;
                    
                    <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" /><br />
                    <br />
                    <asp:Button ID="Button3" runat="server" Text="Delete User" OnClick="Button3_Click" />

                    &nbsp;&nbsp;&nbsp;
                    
                    <asp:Button ID="Button4" runat="server" Text="Delete User and Requests" OnClick="Button4_Click" />
                </div>


            </td>



        </div>
    </div>

    <br />
    <br />

    <br />
    <br />

    <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a id="link1" runat="server" onserverclick="lk1_Click">Edit user information</a>

    <br />

    <div class="row">
        <div class="col-md-12">
            <h2>User Requests:</h2>
        </div>
    </div>
    <!-- /. ROW  -->
    <hr />
    <div>
        <br />

        <div>
            <asp:GridView ID="GridView1" runat="server" RowStyle-Height="20px" RowStyle-CssClass="rowHover" CssClass="gridView" Width="100%" align="center" AllowPaging="True" OnRowDataBound="OnRowDataBound"
                OnSelectedIndexChanged="OnSelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="frmcod" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Both">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="frmcod" HeaderText="Request ID" SortExpression="frmcod" InsertVisible="False" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Title" SortExpression="">
                        <ItemTemplate>
                            <div style="width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis" title='<%#Eval("frmtit") %>'>
                                <%# Eval("frmtit") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="frmsubmitdate" HeaderText="Request date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="frmstatus" HeaderText="Request Status" SortExpression="frmstatus" />
                    <asp:BoundField DataField="frmdate" HeaderText="Deadline" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="frmreqcont" HeaderText="Content Required" />

                    <asp:BoundField DataField="frmurl" HeaderText="Refrence URL's" Visible="false" SortExpression="frmurl" />
                    <asp:BoundField DataField="frmdesc" HeaderText="Description" Visible="false" SortExpression="frmdesc" />
                    <asp:BoundField DataField="pdt" HeaderText="Request Completion date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="pdt" />
                    <asp:BoundField DataField="rdt" HeaderText="User Response date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="rdt" />
                    <asp:TemplateField HeaderText="Image URL" SortExpression="imgurl">
                        <ItemTemplate>
                            <div style="width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis" title='<%#Eval("frmimg") %>'>
                                <%# Eval("frmimg") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Video URL" SortExpression="vidurl">
                        <ItemTemplate>
                            <div style="width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis" title='<%#Eval("frmvideo") %>'>
                                <%# Eval("frmvideo") %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="frmregcod" HeaderText="User ID" SortExpression="frmregcod" />



                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#0000FF" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#0000FF" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>

            </asp:GridView>
            <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myad5ConnectionString %>" SelectCommand="getReeks" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="uid" QueryStringField="uid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
