<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="entrance.aspx.cs" Inherits="entrance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
             <h1 style="text-align:center;">התחברות</h1>
 <form name="formPage" method="post" runat="server" style="text-align:right;">
      <center>

          :אימייל <input type="text" name="gmail" id="gmail" placeholder= "enter your email" > 
<br />
 :סיסמה<input type="text" name="Password" id="Password" placeholder= "enter your Password" > 
<br />
        <br /><br />

      <center>
        <asp:Label ID="msg" runat="server"
            ForeColor="Green"
            Font-Size="Large"></asp:Label>
           </center>







     <input id="Submit1" type="submit" value="שלח" />



     
      </form>
    <%=stResult %>
</asp:Content>

