<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.master" AutoEventWireup="true" CodeFile="viewQuestion.aspx.cs" Inherits="admin_viewQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type = "text/javascript">
<!--
     function Check_Click(objRef) {
         //Get the Row based on checkbox
         var row = objRef.parentNode.parentNode;

         //Get the reference of GridView
         var GridView = row.parentNode;

         //Get all input elements in Gridview
         var inputList = GridView.getElementsByTagName("input");

         for (var i = 0; i < inputList.length; i++) {
             //The First element is the Header Checkbox
             var headerCheckBox = inputList[0];

             //Based on all or none checkboxes
             //are checked check/uncheck Header Checkbox
             var checked = true;
             if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                 if (!inputList[i].checked) {
                     checked = false;
                     break;
                 }
             }
         }
         headerCheckBox.checked = checked;

     }
     function checkAll(objRef) {
         var GridView = objRef.parentNode.parentNode.parentNode;
         var inputList = GridView.getElementsByTagName("input");
         for (var i = 0; i < inputList.length; i++) {
             var row = inputList[i].parentNode.parentNode;
             if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                 if (objRef.checked) {
                     inputList[i].checked = true;
                 }
                 else {
                     if (row.rowIndex % 2 == 0) {
                         row.style.backgroundColor = "#C2D69B";
                     }
                     else {
                         row.style.backgroundColor = "white";
                     }
                     inputList[i].checked = false;
                 }
             }
         }
     }
//-->
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <center>
    <h1><u>Update Database</u></h1>
<asp:UpdatePanel ID="mp" runat="server">
<ContentTemplate>
    <div>
 <asp:GridView ID="gvAll" runat="server" 
    AutoGenerateColumns = "False" Font-Names = "Arial" 
    Font-Size = "11pt" AlternatingRowStyle-BackColor = "Black"  
    HeaderStyle-BackColor = "green" AllowPaging ="True"   
    OnPageIndexChanging = "OnPaging" BackColor="White" DataKeyNames = "qid" 
            BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            GridLines="Vertical" >
   <Columns>
    <asp:TemplateField>
        <HeaderTemplate>
            <asp:CheckBox ID="chkAll" runat="server" 
             onclick = "checkAll(this);" />
        </HeaderTemplate> 
        <ItemTemplate>
            <asp:CheckBox ID="chk" runat="server" 
             onclick = "Check_Click(this)"/>
        </ItemTemplate>
    </asp:TemplateField> 
    <asp:BoundField ItemStyle-Width = "150px" DataField = "qid" 
       HeaderText = "Question ID">
       <ItemStyle Width="150px" />
       </asp:BoundField>
    <asp:BoundField ItemStyle-Width = "150px" DataField = "status" 
       HeaderText = "Status">
       <ItemStyle Width="150px" />
       </asp:BoundField>
    <asp:BoundField ItemStyle-Width = "150px" DataField = "uname" 
       HeaderText = "User Name">
       <ItemStyle Width="150px" />
       </asp:BoundField>
     <asp:BoundField ItemStyle-Width = "150px" DataField = "question" 
       HeaderText = "Question">
       <ItemStyle Width="150px" />
       </asp:BoundField>
   </Columns> 
   <AlternatingRowStyle BackColor="#DCDCDC"  />
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
<asp:HiddenField ID="hfCount" runat="server" Value = "0" />
<asp:Button ID="btnDelete" runat="server" Text="Update Checked Records" 
   OnClientClick = "return ConfirmDelete();" OnClick="btnDelete_Click" />
</div>




    

</ContentTemplate>
</asp:UpdatePanel>
</center>



</asp:Content>

