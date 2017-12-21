<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="admindash_Default" MasterPageFile="~/admindash/MasterPage.master" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12">
            <h2>Users:</h2>
        </div>
    </div>
    <!-- /. ROW  -->
    <hr />
    <div>
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
            <asp:ListItem Value="All">All</asp:ListItem>
            <asp:ListItem Value="Active">Active</asp:ListItem>
            <asp:ListItem Value="Blocked">Blocked</asp:ListItem>
        </asp:DropDownList>

        <br />
        <br />

    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" Style="margin-top: 0px" RowStyle-CssClass="rowHover" Width="100%" align="center" CssClass="gridView" RowStyle-Height="20px" OnRowDataBound="OnRowDataBound"
            OnSelectedIndexChanged="OnSelectedIndexChanged" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" DataKeyNames="regid" ForeColor="#333333" GridLines="Both">
            <AlternatingRowStyle BackColor="White" Height="20px" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="regid" HeaderText="User ID" SortExpression="regid" InsertVisible="False" ReadOnly="True" />
                <asp:TemplateField HeaderText="First Name" SortExpression="">
                    <ItemTemplate>
                        <div style="width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis" title='<%#Eval("f_name") %>'>
                            <%# Eval("f_name") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Last Name" SortExpression="">
                    <ItemTemplate>
                        <div style="width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis" title='<%#Eval("l_name") %>'>
                            <%# Eval("l_name") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email ID" SortExpression="">
                    <ItemTemplate>
                        <div style="width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis" title='<%#Eval("email") %>'>
                            <%# Eval("email") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact No" SortExpression="">
                    <ItemTemplate>
                        <div style="width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis" title='<%#Eval("contact") %>'>
                            <%# Eval("contact") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="address" Visible="false" HeaderText="Address" SortExpression="addr" />
                <asp:TemplateField HeaderText="Password" SortExpression="">
                    <ItemTemplate>
                        <div style="width: 100%; overflow: hidden; white-space: nowrap; text-overflow: ellipsis" title='<%#Eval("password") %>'>
                            <%# Eval("password") %>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="guid" Visible="false" HeaderText="Con. Code" SortExpression="con_code" />
                <asp:BoundField DataField="acc_stat" HeaderText="Account Status" SortExpression="acc_stat" />
                <asp:BoundField DataField="join_date" HeaderText="Joining Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="join_date" />

            </Columns>

            <EditRowStyle CssClass="GridViewEditRow" BackColor="#999999" />
            <FooterStyle BackColor="#0000FF" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#0000FF" Height="40px" Font-Bold="True" ForeColor="White" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myad5ConnectionString %>" SelectCommand="selRegs" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Table1] WHERE [regid] = @original_regid AND (([f_name] = @original_f_name) OR ([f_name] IS NULL AND @original_f_name IS NULL)) AND (([l_name] = @original_l_name) OR ([l_name] IS NULL AND @original_l_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([c_no] = @original_c_no) OR ([c_no] IS NULL AND @original_c_no IS NULL)) AND (([addr] = @original_addr) OR ([addr] IS NULL AND @original_addr IS NULL)) AND (([pass] = @original_pass) OR ([pass] IS NULL AND @original_pass IS NULL)) AND (([con_code] = @original_con_code) OR ([con_code] IS NULL AND @original_con_code IS NULL)) AND (([acc_stat] = @original_acc_stat) OR ([acc_stat] IS NULL AND @original_acc_stat IS NULL)) AND (([join_date] = @original_join_date) OR ([join_date] IS NULL AND @original_join_date IS NULL))" InsertCommand="INSERT INTO [Table1] ([f_name], [l_name], [email], [c_no], [addr], [pass], [con_code], [acc_stat], [join_date]) VALUES (@f_name, @l_name, @email, @c_no, @addr, @pass, @con_code, @acc_stat, @join_date)" UpdateCommand="UPDATE [Table1] SET [f_name] = @f_name, [l_name] = @l_name, [email] = @email, [c_no] = @c_no, [addr] = @addr, [pass] = @pass, [con_code] = @con_code, [acc_stat] = @acc_stat, [join_date] = @join_date WHERE [regid] = @original_regid AND (([f_name] = @original_f_name) OR ([f_name] IS NULL AND @original_f_name IS NULL)) AND (([l_name] = @original_l_name) OR ([l_name] IS NULL AND @original_l_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([c_no] = @original_c_no) OR ([c_no] IS NULL AND @original_c_no IS NULL)) AND (([addr] = @original_addr) OR ([addr] IS NULL AND @original_addr IS NULL)) AND (([pass] = @original_pass) OR ([pass] IS NULL AND @original_pass IS NULL)) AND (([con_code] = @original_con_code) OR ([con_code] IS NULL AND @original_con_code IS NULL)) AND (([acc_stat] = @original_acc_stat) OR ([acc_stat] IS NULL AND @original_acc_stat IS NULL)) AND (([join_date] = @original_join_date) OR ([join_date] IS NULL AND @original_join_date IS NULL))" SelectCommandType="StoredProcedure" ProviderName="System.Data.SqlClient">
            <DeleteParameters>
                <asp:Parameter Name="original_regid" Type="Int32" />
                <asp:Parameter Name="original_f_name" Type="String" />
                <asp:Parameter Name="original_l_name" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_c_no" Type="String" />
                <asp:Parameter Name="original_addr" Type="String" />
                <asp:Parameter Name="original_pass" Type="String" />
                <asp:Parameter Name="original_con_code" Type="Int32" />
                <asp:Parameter Name="original_acc_stat" Type="String" />
                <asp:Parameter DbType="Date" Name="original_join_date" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="f_name" Type="String" />
                <asp:Parameter Name="l_name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="c_no" Type="String" />
                <asp:Parameter Name="addr" Type="String" />
                <asp:Parameter Name="pass" Type="String" />
                <asp:Parameter Name="con_code" Type="Int32" />
                <asp:Parameter Name="acc_stat" Type="String" />
                <asp:Parameter DbType="Date" Name="join_date" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="ast" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="f_name" Type="String" />
                <asp:Parameter Name="l_name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="c_no" Type="String" />
                <asp:Parameter Name="addr" Type="String" />
                <asp:Parameter Name="pass" Type="String" />
                <asp:Parameter Name="con_code" Type="Int32" />
                <asp:Parameter Name="acc_stat" Type="String" />
                <asp:Parameter DbType="Date" Name="join_date" />
                <asp:Parameter Name="original_regid" Type="Int32" />
                <asp:Parameter Name="original_f_name" Type="String" />
                <asp:Parameter Name="original_l_name" Type="String" />
                <asp:Parameter Name="original_email" Type="String" />
                <asp:Parameter Name="original_c_no" Type="String" />
                <asp:Parameter Name="original_addr" Type="String" />
                <asp:Parameter Name="original_pass" Type="String" />
                <asp:Parameter Name="original_con_code" Type="Int32" />
                <asp:Parameter Name="original_acc_stat" Type="String" />
                <asp:Parameter DbType="Date" Name="original_join_date" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
