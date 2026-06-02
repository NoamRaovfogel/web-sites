<%-- שורת ההגדרה של הדף: קובעת את שפת השרת כ-C#, מקשרת ל-MasterPage ומפנה לקובץ ה-cs המתאים --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="entrance.aspx.cs" Inherits="entrance" %>

<%-- פקד תוכן ה-head - כרגע ריק אך נשמר בשביל תקינות המבנה מול דף האב --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<%-- פקד התוכן המרכזי המזריק את הטופס לתוך דף האב --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
             <%-- כותרת הדף ממורכזת --%>
             <h1 style="text-align:center;">התחברות</h1>
             
 <%-- הגדרת טופס ההתחברות: נשלח בשיטת post ומיועד לרוץ בצד השרת --%>
 <form name="formPage" method="post" runat="server" style="text-align:right;">
      <center>

          <%-- שדה קלט מסוג טקסט רגיל לקליטת כתובת האימייל של המשתמש --%>
          :אימייל <input type="text" name="gmail" id="gmail" placeholder= "enter your email" > 
<br />
 <%-- שדה קלט מסוג password המסתיר את התווים שהמשתמש מקליד עבור הסיסמה --%>
 :סיסמה<input type="password" name="Password" id="Password" placeholder= "enter your Password" > 
<br />
        <br /><br />

      <center>
        <%-- פקד שרת מסוג Label המשמש להצגת הודעות דינמיות (כמו הודעות הצלחה או שגיאה) מהקוד ב-C# --%>
        <asp:Label ID="msg" runat="server"
            ForeColor="Green"
            Font-Size="Large"></asp:Label>
           </center>

      <%-- כפתור השליחה של הטופס --%>
      <input id="Submit1" type="submit" value="שלח" />

      </form>
      
    <%-- ביטוי שרת המדפיס ישירות אל תוך ה-HTML את ערכו של המשתנה הציבורי stResult (הודעת השגיאה אם קיימת) --%>
    <%=stResult %>
</asp:Content>