<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="viewSubjectiveQuestion.aspx.cs" Inherits="admin_viewSubjectiveQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
<h1><u>View Subjective Question</u></h1>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataKeyNames="qid" DataSourceID="SqlDataSource1" 
        GridLines="Vertical" Height="114px" Width="625px">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="qid" HeaderText="qid" InsertVisible="False" 
                ReadOnly="True" SortExpression="Question ID" />
            <asp:BoundField DataField="question" HeaderText="Question" 
                SortExpression="question" />
            <asp:BoundField DataField="qdes" HeaderText="Question Description" SortExpression="qdes" />
            <asp:BoundField DataField="o1" HeaderText="Option1" SortExpression="o1" />
            <asp:BoundField DataField="o2" HeaderText="Option1" SortExpression="o2" />
            <asp:BoundField DataField="o3" HeaderText="Option1" SortExpression="o3" />
            <asp:BoundField DataField="username" HeaderText="Username" 
                SortExpression="username" />
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




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:APIIT %>" 
        SelectCommand="SELECT * FROM [sub_ques] WHERE ([username] = @username)">
        <SelectParameters>
            <asp:SessionParameter Name="username" SessionField="emailid" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>




</center>



</asp:Content>

