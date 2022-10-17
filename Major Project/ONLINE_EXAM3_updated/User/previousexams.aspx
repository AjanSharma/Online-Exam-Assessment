<%@ Page Language="C#" MasterPageFile="~/User/Student.master" Title="Untitled Page" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        // Response.Write(" Value = " + Session["mid"]);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Examinations History</h2>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
        PageSize="3" BorderColor="Black" CellPadding="3" CellSpacing="2"  Width="100%" AllowPaging="True">
        <RowStyle Font-Names="Verdana" Font-Size="10pt" />
        <HeaderStyle BackColor="#0000C0" Font-Bold="True" Font-Names="Verdana" Font-Size="10pt"
            ForeColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:examConnectionString %>"
        SelectCommand="SELECT sname, e.noq , nocans, e.noq - nocans nwans, std=convert(varchar(10),stdate,103),&#13;&#10;nomin = datediff(mi,stdate,enddate)   FROM  oe_exams e, oe_subjects s&#13;&#10;where  e.sid = s.sid and   mid = @mid&#13;&#10;order by  stdate desc">
        <SelectParameters>
            <asp:SessionParameter Name="mid" SessionField="mid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

