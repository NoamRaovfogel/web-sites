<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="entrance.aspx.cs" Inherits="entrance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
             <h1 style="text-align:center;">התחברות</h1>
 <form name="formPage" method="post" runat="server" style="text-align:right;">
      <center>

        אימייל:
        <asp:TextBox ID="gmail" runat="server"
            AutoPostBack="true"
            OnTextChanged="gmail_TextChanged"
            Placeholder="enter your gmail"></asp:TextBox>

        <br /><br />

        סיסמה:
        <asp:TextBox ID="password" runat="server"
            Enabled="false"
            AutoPostBack="true"
            OnTextChanged="password_TextChanged"
            Placeholder="enter your password"></asp:TextBox>
          </center>
        <br /><br />

      <center>
        <asp:Label ID="msg" runat="server"
            ForeColor="Green"
            Font-Size="Large"></asp:Label>
           </center>











     
      </form>
</asp:Content>

