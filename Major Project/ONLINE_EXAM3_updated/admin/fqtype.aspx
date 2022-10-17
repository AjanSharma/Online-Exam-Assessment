<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="fqtype.aspx.cs" Inherits="fqtype" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<center>
<h1>Select Question Type</h1>

<table>
<tr>
<td>
    <asp:Label ID="Label9" runat="server" ForeColor="Black" Text="Select Question Type :"></asp:Label>

</td>
<td>
<asp:UpdatePanel ID="qmas" runat="server">
<ContentTemplate>
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
         <asp:ListItem Text="Select Type" Value="Select Type"></asp:ListItem>
    <asp:ListItem Text="label1" Value="label1"></asp:ListItem>
     <asp:ListItem Text="label2" Value="label2"></asp:ListItem>
      <asp:ListItem Text="label3" Value="label3"></asp:ListItem>
       <asp:ListItem Text="label4" Value="label4"></asp:ListItem>
        <asp:ListItem Text="label5" Value="label5"></asp:ListItem>
    </asp:DropDownList>
</ContentTemplate>

</asp:UpdatePanel>
    


</td>
</tr>
</table>
</center>



</asp:Content>

