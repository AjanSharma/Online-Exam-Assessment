<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="viewNoti.aspx.cs" Inherits="viewNoti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

</div>
<h1><u>Admin View Notification</u></h1>
<asp:UpdatePanel ID="noti" runat="server">
<ContentTemplate>

   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="nid" GridLines="Vertical" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
        onrowupdating="GridView1_RowUpdating" Height="151px" Width="828px">
        <AlternatingRowStyle BackColor="Gainsboro" />
        <Columns>
         <asp:TemplateField HeaderText="Test ID">
                <ItemTemplate>
                    <asp:Label ID="Label112132" runat="server" Text='<%# Eval("nid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Test Description">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("udesc") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Notification Date">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ddate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Status">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                    <asp:ListItem Text="Random" Value="Random" ></asp:ListItem>
                    <asp:ListItem Text="Solved" Value="Solved"></asp:ListItem>
                    </asp:RadioButtonList>
                    <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("status") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("estatus") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="false" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>

    </ContentTemplate>

</asp:UpdatePanel>
</center>

</asp:Content>

