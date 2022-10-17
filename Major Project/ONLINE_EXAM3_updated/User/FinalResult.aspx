<%@ Page Title="" Language="C#" MasterPageFile="~/User/Student.master" AutoEventWireup="true" CodeFile="FinalResult.aspx.cs" Inherits="ViewResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
<h2>View Marks </h2>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
        <Series>
            <asp:Series Name="Series1" XValueMember="sname" YValueMembers="Expr2" 
                ChartType="Pie">

           
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:APIIT %>" 
        SelectCommand="SELECT sname, SUM(rans) AS Expr2 FROM Final_Test_Answer GROUP BY sname WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="emailID" Type="String" />
        </SelectParameters>
        
        </asp:SqlDataSource>
<fieldset>
<legend style="color:Black;">View All Question With Time</legend>

<div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Vertical" 
        Height="116px" Width="431px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="sname" HeaderText="Subject Name" SortExpression="sname" />
            <asp:BoundField DataField="uans" HeaderText="User Answer" SortExpression="uans" />
            <asp:BoundField DataField="dbans" HeaderText="Database Answer" SortExpression="dbans" />
            <asp:BoundField DataField="ttime" HeaderText="Total Time" SortExpression="ttime" />
            <asp:BoundField DataField="rans" HeaderText="Real Answer" SortExpression="rans" />
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




    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:APIIT %>" 
        SelectCommand="SELECT [sname], [uans], [dbans], [ttime], [rans] FROM [Final_Test_Answer] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="emailID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>




</div>
</fieldset>
</center>



</asp:Content>

