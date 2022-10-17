<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="addSubjective.aspx.cs" Inherits="admin_addSubjective" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>Add Subjective Question</u></h1>
<table>
<tr>
<td align="right">
    <asp:Label ID="Label1" runat="server" Text="Question :" ForeColor="Black"></asp:Label></td>

    <td>
        <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine" Height="132px" 
            Width="458px"></asp:TextBox>
    
    </td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label2" runat="server" Text="Question Description :" ForeColor="Black"></asp:Label></td>

    <td>
        <asp:TextBox ID="txtdes" runat="server" TextMode="MultiLine" Height="67px" 
            Width="228px"></asp:TextBox>
    
    </td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label3" runat="server" Text="Output 1 :" ForeColor="Black"></asp:Label></td>

    <td>
        <asp:TextBox ID="txt1" runat="server" TextMode="SingleLine" Height="35px" 
            Width="218px"></asp:TextBox>
    
    </td>


</tr>
<tr>
<td align="right">
    <asp:Label ID="Label4" runat="server" Text="Output 2:" ForeColor="Black"></asp:Label></td>

    <td>
        <asp:TextBox ID="txt2" runat="server" TextMode="SingleLine" Height="35" Width="218px" ></asp:TextBox>
    
    </td>
</tr>
<tr>
<td align="right">
    <asp:Label ID="Label5" runat="server" Text="Output 3 :" ForeColor="Black"></asp:Label></td>

    <td>
        <asp:TextBox ID="txt3" runat="server" TextMode="SingleLine" Height="35" Width="218px"></asp:TextBox>
    
    </td>


</tr>
<tr>
<td colspan="2" align="center">

    <asp:Button ID="Button1" runat="server" Text="Save Question" 
        onclick="Button1_Click" />

</td>

</tr>


</table>




</center>




</asp:Content>

