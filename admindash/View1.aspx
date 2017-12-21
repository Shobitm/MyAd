<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View1.aspx.cs" MasterPageFile="~/admindash/MasterPage.master" Inherits="admindash_Default5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>Request Details:</h2>
        </div>
    </div>
    <!-- /. ROW  -->
    <hr />
    <br />
    <br />
    <div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myad5ConnectionString %>" SelectCommand="getRek" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:QueryStringParameter Name="rid" QueryStringField="rid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridView" align="center" Width="100%" CellPadding="4" DataKeyNames="frmcod" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="Both">
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
                <asp:BoundField DataField="frmreqcont" HeaderText="Content Required"/>

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
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center"/>
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

        </div>
    </div>
    <br />
    <div>
        <asp:Label ID="Label1" runat="server" Text="Reference URL's:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Height="100px" Width="100%" Style="resize: none" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>

    </div>
    <br />
    <div>
        <asp:Label ID="Label2" runat="server" Text="Description:"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Height="200px" Width="100%" Style="resize: none" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
    </div>
    <hr />
    <div>
        <asp:Label ID="Label3" runat="server" Text="Select Image:"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="val1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Upload an Image" ForeColor="Red"></asp:RequiredFieldValidator>
        <br /><asp:Label ID="Label4" runat="server" Text="Select Video:"></asp:Label>
        <asp:FileUpload ID="FileUpload2" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="val1" ControlToValidate="FileUpload2" ErrorMessage="Upload a Video" ForeColor="Red"></asp:RequiredFieldValidator>
        <br /><asp:Button ID="Button2" runat="server" Text="Use External Video URL" OnClick="Button2_Click" Style="margin-top: 0px" />&nbsp;&nbsp;&nbsp; <asp:Label ID="Label5" runat="server" Text="External Video URL(optional):"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="val1" ControlToValidate="TextBox3" ErrorMessage="Enter video URL" ForeColor="Red"></asp:RequiredFieldValidator>
        <br /><asp:Button ID="Button3" runat="server" Text="Upload" ValidationGroup="val1" OnClick="Button3_Click" Style="margin-top: 0px" /><br />
        
        

    </div>
</asp:Content>
