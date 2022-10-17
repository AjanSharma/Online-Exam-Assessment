<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Home.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
<script type="text/javascript" src="../js/scw.js">
</script>
<script language="javascript" type="text/javascript">
    function onlyNumbers(evt) {
        var e = event || evt;
        var charCode = e.which || e.keyCode;
        if ((charCode > 47 && charCode < 58))
            return true;
        else
            return false;
    }
    function OnlyChars(evt) {
        var e = event || evt;
        var charCode = e.which || e.keyCode;
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || charCode == 32)
            return true;
        else
            return false;
    }
    function onlyNumbersdot(evt) {
        var e = event || evt;
        var charCode = e.which || e.keyCode;
        if (charCode > 47 && charCode < 58 || charCode == 46)
            return true;
        else
            return false;
    }
    function onlyNumbershifen(evt) {
        var e = event || evt;
        var charCode = e.which || e.keyCode;
        if ((charCode > 47 && charCode < 58 || charCode == 45))
            return true;
        else
            return false;
    }
    function onlyNumbersUnderScore(evt) {
        var e = event || evt;
        var charCode = e.which || e.keyCode;
        if ((charCode > 47 && charCode < 58 || charCode == 95))
            return true;
        else
            return false;
    }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <fieldset>
    <legend style="color:Black">New User Register Here</legend>
    
    
<table align="center" 
        style="padding: 11; color: #ffffff; ">
        <tr>
        <td align="right">
            <asp:Label ID="Label17" runat="server" Text="User ID :" ForeColor="Black"></asp:Label></td>
        <td class="style1">
            
            <asp:TextBox ID="txtID" runat="server" Width="145" Height="30" ReadOnly="true"></asp:TextBox></td>
            <td align="center" colspan="3" height="25">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="Red" Visible="False"></asp:Label></td>  
        </tr>
        
        <tr style="color: #000000">
        <td align="right" height="25">
            <asp:Label ID="Label19" runat="server" Text="Email ID :"></asp:Label>
                </td>
               <td class="style1" >
                        <asp:TextBox ID="txtEmail" runat="server"  Width="145" Height="30" ></asp:TextBox>
                        
                    </td>
                    <td align="right" style="width: 147px">
                        <asp:Label ID="Label20" runat="server" Text="Confirm Email ID :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtcEmail" runat="server" Width="145" Height="30"></asp:TextBox>
                       
                    </td>   
        

            
        </tr>
        <tr>
        <td colspan="2">
        <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Enter a valid emailid" ForeColor="Red"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
        </td>
        <td colspan="2">
         <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red"
                            ErrorMessage="Check Email ID" ControlToCompare="txtEmail" 
                            ControlToValidate="txtcEmail"></asp:CompareValidator>
        </td>
        
        </tr>
        <tr style="color: #000000">
        <td align="right" height="25">
                <asp:Label ID="Label1" runat="server" Text="First Name :"></asp:Label></td>
            <td class="style1">
                <span style="font-size: 7pt; color: #ff0000">&nbsp;</span><asp:TextBox ID="txtFname"
                    runat="server" ReadOnly="false" Width="145" Height="30" OnKeypress="return OnlyChars(event)"></asp:TextBox> 
                    </td>
                    <td align="right" style="width: 147px">
                    <asp:Label ID="Label15" runat="server" Text="Last Name :" ></asp:Label>
                    </td>
                    <td>
                    <asp:TextBox ID="txtLName"
                    runat="server" ReadOnly="false" Width="145" Height="30" maxlength="25" OnKeypress="return OnlyChars(event)"></asp:TextBox>
                    </td>
        </tr>
        <tr style="color: #000000">

         <td align="right">
            <asp:Label ID="Label16" runat="server" Text="Gender :" ForeColor="Black"></asp:Label></td>
       
            <td>
               
                &nbsp;<asp:DropDownList Width="145" Height="30" ID="DropDownList1" runat="server">
                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:DropDownList>
        </td>
     
               
                            
                <td align="right" height="25">
                 <asp:Label ID="Label6" runat="server" ForeColor="Black" Text="Father's Name :"></asp:Label>
                    </td>
            <td>
                <asp:TextBox ID="txtFather" runat="server" CausesValidation="True" MaxLength="30"
                    TabIndex="3"  Width="145" Height="30" OnKeypress="return OnlyChars(event)"></asp:TextBox>
                </td>
            
                    
        </tr>
        <tr style="color: #000000">
        <td align="right" height="25">
                <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label></td>
            <td class="style1" >
                &nbsp;<asp:TextBox 
                    ID="txtPass" runat="server" MaxLength="15" TabIndex="1" TextMode="Password"
                     Width="145" Height="30"></asp:TextBox>
                    </td>
                    <td align="right" style="width: 147px">
                    <asp:Label ID="Label14" runat="server" Text="Confirm Password :"></asp:Label>
                    </td>
                    <td>
                    <asp:TextBox ID="txtcPass" runat="server" MaxLength="15" TabIndex="1" TextMode="Password"
                    Width="145" Height="30"></asp:TextBox>
                   
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ErrorMessage="Check Password" ControlToCompare="txtPass" 
                            ControlToValidate="txtcPass"></asp:CompareValidator>
                   
                    </td>
        </tr>
        
         <tr>
            <td align="right" height="25">
                <asp:Label ID="Label13" runat="server" ForeColor="Black" Text="Date Of Birth :"></asp:Label>
            </td>
            <td class="style1">
            &nbsp;<asp:TextBox ID="TextBox1" runat="server"  Width="145" Height="30"  ReadOnly="false" onclick="showCal(this, event)"></asp:TextBox>
             
               <td align="right"  >
                    &nbsp;</td>
                    <td>
                        &nbsp;</td>
        
               
        </tr>
       
        <tr>
            <td align="right" height="25">
                <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="Address :"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;<asp:TextBox ID="txtAdd" runat="server" CausesValidation="True" Height="58px"
                    MaxLength="250" TabIndex="7" TextMode="MultiLine" Width="150px"></asp:TextBox>
                </td>
                     <td align="right" height="25">
                <asp:Label ID="Label5" runat="server" ForeColor="Black" Text="City :"></asp:Label>
            </td>
            <td>
                
                <asp:TextBox ID="txtCity" runat="server"  Width="145" Height="30" OnKeypress="return OnlyChars(event)"></asp:TextBox>
            </td>
        </tr>
        <tr>
             <td align="right" height="25">
                <asp:Label ID="Label3" runat="server"  ForeColor="Black" Text="State :"></asp:Label>
            </td>
            <td class="style1" >
                <asp:DropDownList ID="txtState" runat="server" TabIndex="9"  Width="145" Height="30">
                    <asp:ListItem Text="----Select----" Value="n"></asp:ListItem>
                    <asp:ListItem Text="Andhra Pradesh"></asp:ListItem>
                    <asp:ListItem Text="Assam"></asp:ListItem>
                    <asp:ListItem Text="Bihar"></asp:ListItem>
                    <asp:ListItem Text="Chhattisgarh"></asp:ListItem>
                    <asp:ListItem Text="Goa"></asp:ListItem>
                    <asp:ListItem Text="Gujarat"></asp:ListItem>
                    <asp:ListItem Text="Haryana"></asp:ListItem>
                    <asp:ListItem Text="Jammu and Kasmir"></asp:ListItem>
                    <asp:ListItem Text="Jharkhand"></asp:ListItem>
                    <asp:ListItem Text="Karnataka"></asp:ListItem>
                    <asp:ListItem Text="Maharashtra"></asp:ListItem>
                    <asp:ListItem Text="Madhya Pradesh"></asp:ListItem>
                     <asp:ListItem Text="Manipur"></asp:ListItem>
                      <asp:ListItem Text="Meghalaya"></asp:ListItem>
                       <asp:ListItem Text="Mizoram"></asp:ListItem>
                        <asp:ListItem Text="Nagaland"></asp:ListItem>
                         <asp:ListItem Text="New Delhi"></asp:ListItem>
                          <asp:ListItem Text="Orissa"></asp:ListItem>
                            <asp:ListItem Text="Punjab"></asp:ListItem>
                             <asp:ListItem Text="Rajasthan"></asp:ListItem>
                            <asp:ListItem Text="Sikkim"></asp:ListItem>
                              <asp:ListItem Text="Tamil Nadu"></asp:ListItem>
             <asp:ListItem Text="Tripura"></asp:ListItem>
              <asp:ListItem Text="Uttar Pradesh"></asp:ListItem>
             <asp:ListItem Text="Uttarakhand"></asp:ListItem>
                               <asp:ListItem Text="West Bengal"></asp:ListItem>
                                                          
                                                           
      
                </asp:DropDownList>
                
            </td>
            <td align="right" height="25">
                <asp:Label ID="Label21" runat="server" ForeColor="Black" Text="Postal Code :"></asp:Label>
            </td>
            <td colspan="2">
                &nbsp;<asp:TextBox ID="txtPostal" runat="server" CausesValidation="True" MaxLength="6"
                    TabIndex="10"  Width="145" Height="30" OnKeypress="return onlyNumbers(event)"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td align="right" height="25">
                <asp:Label ID="Label7" runat="server" ForeColor="Black" Text="Country :"></asp:Label></td>
            <td class="style1">
                <asp:DropDownList ID="txtCountry"  Width="145" Height="30" runat="server" TabIndex="9" 
                    >
                    <asp:ListItem Text="----Select----" Value="n"></asp:ListItem>
                    <asp:ListItem Text="India"></asp:ListItem>
                   
                </asp:DropDownList>
            </td>
             <td align="right" height="25">
                <asp:Label ID="Label8" runat="server" ForeColor="Black" Text="Phone No :"></asp:Label>
            </td>
            <td colspan="2">
                &nbsp;<asp:TextBox ID="txtPone" runat="server" CausesValidation="True" MaxLength="10"
                    TabIndex="10"  Width="145" Height="30" OnKeypress="return onlyNumbers(event)"></asp:TextBox >
                
                
            </td>
        </tr>
        <tr>
<td align="right">
    <asp:Label ID="Label10" runat="server" ForeColor="Black" Text="Image :"></asp:Label></td>
<td>
<asp:UpdatePanel ID="image" runat="server">
<ContentTemplate>

 <asp:Image ID="Image1" runat="server" Height="93px" Width="122px" /><br />
    <asp:FileUpload ID="FileUpload1" runat="server" /><br />
    

</ContentTemplate>
</asp:UpdatePanel>
   <asp:Button ID="Button2" runat="server" Text="Upload Image" 
        onclick="Button2_Click" />
    </td>
</tr>
        <tr>
            <td align="center" colspan="4" style="height: 24px">
                <asp:Button ID="Button1" runat="server" CssClass="bttn" 
                    Text="Register" onclick="Button1_Click1" Width="260px" Height="38px" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
        </tr>
    </table></fieldset>
</center>
</asp:Content>

