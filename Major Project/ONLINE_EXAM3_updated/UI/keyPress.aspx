<%@ Page Title="" Language="C#" MasterPageFile="~/User/Student.master" AutoEventWireup="true" CodeFile="keyPress.aspx.cs" Inherits="UI_keyPress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="jquery.js" type="text/javascript"></script>
 

    <script type="text/javascript"  lang="js">

        $(function () {

            $("input[type=text]").keypress(function () {

                alert("Wow; Its Work!.")



            });

        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>

   

        <asp:TextBox ID="TextBox1" runat="server" style="top: 158px; left: 414px; position: absolute; height: 22px; width: 128px"></asp:TextBox>

   

    </div>

      
</asp:Content>

