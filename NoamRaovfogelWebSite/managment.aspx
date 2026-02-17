<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managment.aspx.cs" Inherits="managment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <center>
    <h1>הנהלה</h1>
        </center>
          <h1 style="text-align:right;">האתר הרשמי של אוהדי ברצלונה</h1>
  <form name="formPage" method="post" runat="server" style="text-align:right;">
    :שם פרטי ושם משפחה  <input type="text" name="name" id="name" placeholder="enter your name"> 
      <br />
      שחקני כדורגל אהובים: 
      <br />
      מסי<input type="checkbox" name="check2" checked value="מסי" id="check_1"><br />
      ניימאר: <input type="checkbox" name="check2" value="ניימאר" id="check_2"><br />
     ראפיניה<input type="checkbox" name="check2" value="רונאלדו"  id="check_3"><br />
      פדרי: <input type="checkbox" name="check2" value="פדרי" id="check_4">
       <br />
       <br />
    
      <br />
       
      <input id="Submit1" type="submit" value="שלח" />
  </form>
   <center>


        <br />
        <br />
           <%=st %>
         <br />
        </center>
</asp:Content>

