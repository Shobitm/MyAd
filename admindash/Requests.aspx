<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Requests.aspx.cs" EnableEventValidation="false" MasterPageFile="~/admindash/MasterPage.master" Inherits="admindash_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row">
        <div class="col-md-12">
            <h2>Requests:</h2>
        </div>
    </div>
    <!-- /. ROW  -->
    <hr />
    <div>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
            <asp:ListItem Value="All">All</asp:ListItem>
            <asp:ListItem Value="New">New</asp:ListItem>
            <asp:ListItem Value="Accepted by Admin">Accepted by Admin</asp:ListItem>
            <asp:ListItem Value="Rejected by Admin">Rejected by Admin</asp:ListItem>
            <asp:ListItem Value="Waiting Response">Waiting Response</asp:ListItem>
            <asp:ListItem Value="Accepted by User">Accepted by User</asp:ListItem>
            <asp:ListItem Value="Rejected by User">Rejected by User</asp:ListItem>
            <asp:ListItem Value="Request Changed">Request Changed</asp:ListItem>
            <asp:ListItem Value="Accepted by Default">Accepted by Default</asp:ListItem>
        </asp:DropDownList>

        <br />
        <br />

    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" Style="margin-top: 0px" RowStyle-CssClass="rowHover" AllowPaging="True" Width="100%" CssClass="gridView" align="center" RowStyle-Height="20px" OnRowDataBound="OnRowDataBound"
            OnSelectedIndexChanged="OnSelectedIndexChanged" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="frmcod" CellPadding="4" ForeColor="#333333" GridLines="Both">
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
            <HeaderStyle BackColor="#0000FF" Font-Bold="True" ForeColor="White" CssClass="gridView" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center"/>
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            <EmptyDataRowStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
            <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
        </asp:GridView>
        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myad5ConnectionString %>" SelectCommand="selReks" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="rst" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
