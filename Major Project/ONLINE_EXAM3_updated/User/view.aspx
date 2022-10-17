<%@ Page Title="" Language="C#" MasterPageFile="~/User/Student.master" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h1><u>View Graph of Subject Wise Marks</u></h1>
<div>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <asp:GridView ID="gvData" runat="server" BackColor="Black">
        </asp:GridView>
        <br />
        <br />
        <asp:Literal ID="ltScripts" runat="server"></asp:Literal>
        <div id="piechart_3d" style="width: 900px; height: 500px;">
        </div>
    </div>



</center>
</asp:Content>

