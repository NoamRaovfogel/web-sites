<%-- שורת ההגדרה של הדף: מקשרת ל-MasterPage, מגדירה את שפת הקוד כ-C#, ומפנה לקובץ השרת managment.aspx.cs --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managment.aspx.cs" Inherits="managment" %>

<%-- פקד תוכן ה-head - כרגע נשאר ריק לתקינות המבנה מול דף האב --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<%-- פקד התוכן המרכזי המזריק את ממשק פאנל הניהול והטבלה לתוך ה-MasterPage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <%-- כותרות הפאנל המרכזיות --%>
        <h1>פאנל הנהלה</h1>
        <h2>האתר הרשמי של אוהדי ברצלונה</h2>
    </center>

    <br />

    <%-- טופס החיפוש והסינון: נשלח בשיטת post, רץ בצד השרת, ומיושר לימין עם מרווח מהצד --%>
    <form name="formPage" method="post" runat="server" dir="rtl" style="margin-right: 10%;">
        
        <%-- שדה קלט טקסט חופשי לחיפוש משתמש לפי שמו --%>
        <b>חיפוש לפי שם:</b> 
        <input type="text" name="name" id="name" placeholder="הכנס שם לחיפוש..." /> 
        <br /><br />
        
        <%-- קבוצת תיבות סימון (Checkboxes) בעלות שם זהה (check2) המאפשרות סינון משתמשים לפי בחירותיהם בהרשמה --%>
        <b>סינון לפי שחקן אהוב:</b>
        <br />
        <input type="checkbox" name="check2" checked="checked" value="מסי" id="check_1" /> מסי<br />
        <input type="checkbox" name="check2" value="ניימאר" id="check_2" /> ניימאר<br />
        <input type="checkbox" name="check2" value="ראפיניה" id="check_3" /> ראפיניה<br />
        <input type="checkbox" name="check2" value="פדרי" id="check_4" /> פדרי<br />
        
        <br />
        <%-- כפתור שליחה המפעיל את ה-PostBack ומריץ את החיפוש והסינון בשרת --%>
        <input id="Submit1" type="submit" value="חפש משתמשים" style="padding: 5px 15px; cursor: pointer;" />
    </form>

    <center>
        <br /><br />
        <%-- ביטוי שרת המדפיס ישירות את מחרוזת ה-st שמכילה את קוד ה-HTML של טבלת המשתמשים או הודעת "לא נמצאו" --%>
        <%=st %>
        <br />
    </center>

</asp:Content>