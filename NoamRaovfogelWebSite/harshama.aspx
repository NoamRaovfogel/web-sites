<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="harshama.aspx.cs" Inherits="harshama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <center>
      <h1>הרשמה</h1>
          </center>
            <h1 style="text-align:right;">האתר הרשמי של אוהדי ברצלונה</h1>
    <form name="formPage" method="post" runat="server" style="text-align:right;">
      :שם פרטי ושם משפחה  <input type="text" name="name" id="name" placeholder="enter your name"> 
        <br />
           :אימייל <input type="text" name="gmail" id="gmail" placeholder= "enter your email" > 
        <br />
         :סיסמה<input type="text" name="Password" id="Password" placeholder= "enter your Password" > 
        <br />
    :מספר טלפון <input type="text" name="phonenumber" id="phonenumber" placeholder="optional field"> 
           <br />
           <br />
        שחקני כדורגל אהובים: 
        <br />
        מסי<input type="checkbox" name="check2" checked value="מסי" id="check_1"><br />
        ניימאר: <input type="checkbox" name="check2" value="ניימאר" id="check_2"><br />
       ראפיניה<input type="checkbox" name="check2" value="רונאלדו"  id="check_3"><br />
        פדרי: <input type="checkbox" name="check2" value="פדרי" id="check_4">
         <br />
         <br />
       מאמן כדורגל אהוב: 
        <br />
       האנסי פליק<input type="radio" name="radio1" checked value=" האנסי פליק" id="radio_1"><br />
        רונלד קואמן<input type="radio" name="radio1" value="רונלד קואמן" id="radio_2"><br />
       צ'אבי הרננדז<input type="radio" name="radio1" value="צ'אבי הרננדז"  id="radio_3"><br />
        לואיס אנריקה<input type="radio" name="radio1" value=" לואיס אנריקה" id="radio_4"><br />
        תשובה פתוחה:
         <br />
        <br />

        האם אתה מרשה לקבל עדכונים לכתובת הדואר האלקטרוני שלך
         <br />
           כן<input type="radio" name="radio3"  value="כן" id="radio_5"><br />
     לא<input type="radio" name="radio3" value="לא" id="radio_6"><br />
          <br />
          <br />
             האם אתה מאשר את התקנון
      <br />
        כן<input type="radio" name="radio2"  value="כן" id="radio_7"><br />
  לא<input type="radio" name="radio2" value="לא" id="radio_8"><br />
       <br />
       <br />
        <textarea rows="5" cols="20" name="textarea1" id="textarea1" placeholder="הכנס מלל חופשי"></textarea>
         <br />
        <br />
        <select name="age" id="age">
            <option value="0">בחר גיל</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
        </select>
        <br />
         
        <input id="Submit1" type="submit" value="שלח" />
    </form>
     <center>


           
        <%=שם %>
           <br />
         <br />
        <%=אימייל%>
          <br />
         <br />
        <%=טלפון  %>
          <br />
         <br />
        <%=שחקן %>
          <br />
         <br />
        <%=מאמן%>
          <br />
         <br />
        <%=עדכונים %>
          <br />
         <br />
        <%=תקנון %>
          <br />
         <br />
        <%=גיל %>
           <br />
           <br />
          <%=סיסמה %>
          <br />
          <br />
             <%=st %>
           <br />
          </center>
</asp:Content>

