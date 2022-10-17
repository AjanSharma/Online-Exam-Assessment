<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="SendMail_multi_user.aspx.cs" Inherits="SendMail_multi_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Send Mail to Multi User</u></h1>
<table>
<tr>
<td colspan="2" align="center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" style="background-color:Black;">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:CheckBox ID="chkSelect" runat="server" Checked="true" />
            </ItemTemplate>
        </asp:TemplateField>
       
        <asp:BoundField DataField="fname" HeaderText="Name" ItemStyle-Width="150" />
        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <asp:HyperLink ID="lnkEmail" runat="server" Text='<%# Eval("emailID") %>' NavigateUrl='<%# Eval("emailID", "mailto:{0}") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

</td>

</tr>
<tr>
<td>
    <asp:Label ID="Label3" runat="server" Text="OTP :" ForeColor="Black"></asp:Label></td>
    <td>
        <asp:TextBox ID="txtotp" runat="server" Height="30" Width="170" ReadOnly></asp:TextBox></td>
</tr>
<tr>
<td>
    <asp:Label ID="Label1" runat="server" Text="Description :" ForeColor="Black"></asp:Label></td>

    <td>
        <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Height="60px" 
            Width="201px"></asp:TextBox></td>

</tr>

<tr>
<td colspan="2" align="center">
   
<asp:Button ID="Button1" Text="Send Bulk Email" runat="server" OnClick = "SendBulkEmail" />
</td>
</tr>



</table>


</center>



</asp:Content>

