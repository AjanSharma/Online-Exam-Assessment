<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="selectDB.aspx.cs" Inherits="admin_selectDB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Update Question Details</h1>
<center>
 <table>
 <tr>
 <td>
     <asp:Label ID="Label2" runat="server" Text="Select Database To Update :" ForeColor="Black"></asp:Label></td>
 <td>
     <asp:DropDownList ID="DropDownList1" runat="server">
     <asp:ListItem Text="Eassy" Value="Eassy"></asp:ListItem>
     <asp:ListItem Text="Medium" Value="Medium"></asp:ListItem>
     <asp:ListItem Text="Hard" Value="Hard"></asp:ListItem>
     </asp:DropDownList>
 </td>
 <td>
     <asp:Button ID="Button1" runat="server" Text="View Question" 
         onclick="Button1_Click" />
 
 </td>
 </tr> 
 </table>
 </center>
</asp:Content>

