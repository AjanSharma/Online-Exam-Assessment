<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="CS.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Delete Selected Records from Gridview Example</title>
     <script type = "text/javascript">
<!--
function Check_Click(objRef)
{
    //Get the Row based on checkbox
    var row = objRef.parentNode.parentNode;
    
    //Get the reference of GridView
    var GridView = row.parentNode;
    
    //Get all input elements in Gridview
    var inputList = GridView.getElementsByTagName("input");
    
    for (var i=0;i<inputList.length;i++)
    {
        //The First element is the Header Checkbox
        var headerCheckBox = inputList[0];
        
        //Based on all or none checkboxes
        //are checked check/uncheck Header Checkbox
        var checked = true;
        if(inputList[i].type == "checkbox" && inputList[i] != headerCheckBox)
        {
            if(!inputList[i].checked)
            {
                checked = false;
                break;
            }
        }
    }
    headerCheckBox.checked = checked;
    
}
function checkAll(objRef)
{
    var GridView = objRef.parentNode.parentNode.parentNode;
    var inputList = GridView.getElementsByTagName("input");
    for (var i=0;i<inputList.length;i++)
    {
        var row = inputList[i].parentNode.parentNode;
        if(inputList[i].type == "checkbox"  && objRef != inputList[i])
        {
            if (objRef.checked)
            {
                inputList[i].checked=true;
            }
            else
            {
                if(row.rowIndex % 2 == 0)
                {
                   row.style.backgroundColor = "#C2D69B";
                }
                else
                {
                   row.style.backgroundColor = "white";
                }
                inputList[i].checked=false;
            }
        }
    }
}
//-->
</script>
<script type = "text/javascript">
    function ConfirmDelete()
    {
        var count = document.getElementById("<%=hfCount.ClientID %>").value;
        var gv = document.getElementById("<%=gvAll.ClientID%>");
        var chk = gv.getElementsByTagName("input");
        for(var i=0;i<chk.length;i++)
        {
            if(chk[i].checked && chk[i].id.indexOf("chkAll") == -1)
            {
                count++;
            }
        }
        if(count == 0)
        {
            alert("No records to delete.");
            return false;
        }
        else
        {
            return confirm("Do you want to delete " + count + " records.");
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
 <asp:GridView ID="gvAll" runat="server" 
    AutoGenerateColumns = "false" Font-Names = "Arial" 
    Font-Size = "11pt" AlternatingRowStyle-BackColor = "#C2D69B"  
    HeaderStyle-BackColor = "green" AllowPaging ="true"   
    OnPageIndexChanging = "OnPaging" DataKeyNames = "qid"
    PageSize = "10" >
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
       HeaderText = "Contact Name"/>
    <asp:BoundField ItemStyle-Width = "150px" DataField = "status" 
       HeaderText = "Country"/>
    <asp:BoundField ItemStyle-Width = "150px" DataField = "uname" 
       HeaderText = "City"/>
   </Columns> 
   <AlternatingRowStyle BackColor="#C2D69B"  />
</asp:GridView> 
<asp:HiddenField ID="hfCount" runat="server" Value = "0" />
<asp:Button ID="btnDelete" runat="server" Text="Update Checked Records" 
   OnClientClick = "return ConfirmDelete();" OnClick="btnDelete_Click" />
</div>
    </form>
</body>
</html>
