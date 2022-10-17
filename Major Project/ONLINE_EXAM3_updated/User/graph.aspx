<%@ Page Title="" Language="C#" MasterPageFile="~/User/Student.master" AutoEventWireup="true" CodeFile="graph.aspx.cs" Inherits="graph" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<fieldset>
<legend style="background-color: #008000">View Graph </legend>
   <center>
       <asp:Label ID="lblSub" runat="server" Text="Label"></asp:Label>
       <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
           <Series>
               <asp:Series Name="Series1" ChartType="Pie" XValueMember="sname">
               </asp:Series>
           </Series>
           <ChartAreas>
               <asp:ChartArea Name="ChartArea1">
               </asp:ChartArea>
           </ChartAreas>
       </asp:Chart>
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:APIIT %>" 
           SelectCommand="SELECT DISTINCT [sname] FROM [exam1]"></asp:SqlDataSource>
    </center>

</fieldset>

</asp:Content>

