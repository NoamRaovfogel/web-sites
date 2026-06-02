<%-- שורת ההגדרה של הדף: מקשרת ל-MasterPage, מגדירה את שפת צד השרת (C#) ומפנה לקובץ השרת ShowPlayers.aspx.cs --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowPlayers.aspx.cs" Inherits="ShowPlayers" %>

<%-- פקד תוכן ה-head - כרגע נשאר ריק לתקינות המבנה מול דף האב --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<%-- פקד התוכן המרכזי המזריק את ממשק הצגת השחקנים והטבלה הדינמית לתוך ה-MasterPage --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <%-- כותרת הדף המרכזית --%>
        <h1>רשימת השחקנים</h1>
        
        <%-- תיבת ממשק המשתמש עבור מנגנון החיפוש החכם --%>
        <div style="border: 1px solid white; padding: 10px; width: 50%; margin-bottom: 20px;">
            <h3>חיפוש שחקן חכם</h3>
            <p>הכנס את שם השחקן או חלק מהשם שלו, והמערכת תמצא עבורך את כל השחקנים שמתאימים לחיפוש (חיפוש חלקי - LIKE).</p>
            
            <%-- טופס החיפוש: נשלח בשיטת post ומפנה אל אותו הדף עצמו כדי לעבד את הנתונים מחדש --%>
            <form method="post" action="ShowPlayers.aspx">
                <%-- שדה קלט לקבלת מחרוזת החיפוש מהמשתמש --%>
                <input type="text" name="searchName" placeholder="הכנס שם לחיפוש..." />
                <%-- כפתור לשליחת טופס החיפוש --%>
                <input type="submit" value="חפש שחקן" />
            </form>
        </div>

        <br />
        <%-- ביטוי שרת המדפיס ישירות את מחרוזת ה-st המכילה את קוד ה-HTML של טבלת השחקנים הדינמית או הודעת שגיאה --%>
        <%= st %>
    </center>
</asp:Content>