<%-- שורת ההגדרה של הדף: מקשרת ל-MasterPage, מגדירה הרצה בצד שרת ומפנה לקובץ הקוד Add.aspx.cs --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<%-- פקד תוכן המזריק קוד ל-head של דף האב - כאן נשים את פונקציית ה-JavaScript לבדיקת הטופס --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript">
        // פונקציה לבדיקת תקינות נתוני הטופס בצד הלקוח (לפני שהנתונים נשלחים לשרת)
        function checkAdd() {
            // שליפת הערכים שהוקלדו בשדות הטופס באמצעות ה-ID של כל שדה
            name = document.getElementById("textarea2").value;
            age = document.getElementById("textarea3").value;
            trophies = document.getElementById("textarea4").value;
            clubs = document.getElementById("textarea5").value;
            idol = document.getElementById("textarea6").value;

            // בדיקה האם שדה שם השחקן נשאר ריק
            if (name == "") {
                alert("חובה להזין את שם השחקן"); // הקפצת הודעת שגיאה למשתמש
                return false; // עצירת שליחת הטופס לשרת
            }
            // בדיקה האם שדה הגיל נשאר ריק
            if (age == "") {
                alert("חובה להזין גיל"); // הקפצת הודעת שגיאה למשתמש
                return false; // עצירת שליחת הטופס לשרת
            }
            // בדיקה באמצעות הפונקציה isNaN האם הערך שהוזן בגיל אינו מספר (Is Not a Number)
            if (isNaN(age) == true) {
                alert("גיל חייב להיות מספר"); // הקפצת הודעת שגיאה
                return false; // עצירת שליחת הטופס
            }
            // בדיקה האם שדה הגביעים נשאר ריק
            if (trophies == "") {
                alert("חובה להזין גביעים"); // הקפצת הודעת שגיאה
                return false; // עצירת שליחת הטופס
            }
            // בדיקה האם בשדה גביעים הוקלד ערך שאינו מספר
            if (isNaN(trophies) == true) {
                alert("גביעים חייב להיות מספר"); // הקפצת הודעת שגיאה
                return false; // עצירת שליחת הטופס
            }
            // הוספת בדיקה לשני השדות שנשארו כדי לענות על דרישת המחוון "לכל השדות"
            // בדיקה האם שדה קבוצות נוספות נשאר ריק
            if (clubs == "") {
                alert("חובה להזין קבוצות נוספות"); // הקפצת הודעת שגיאה
                return false; // עצירת שליחת הטופס
            }
            // בדיקה האם שדה שחקן השראה נשאר ריק
            if (idol == "") {
                alert("חובה להזין שחקן השראה"); // הקפצת הודעת שגיאה
                return false; // עצירת שליחת הטופס
            }

            return true; // אם כל הבדיקות עברו בהצלחה, הפונקציה מחזירה אמת והטופס נשלח לשרת
        }
    </script>
</asp:Content>

<%-- פקד תוכן המזריק את הטופס והמבנה לתוך ה-ContentPlaceHolder המרכזי של דף האב --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <%-- כותרת הדף המרכזית --%>
        <h1>  הוספת פריט - כאן תוכלו לשתף מידע על השחקנים האהובים עליכם</h1>
    </center>
    <%-- תת כותרת מיושרת לימין --%>
    <h1 style="text-align:right;">האתר הרשמי של אוהדי ברצלונה</h1>
    
    <%-- הגדרת הטופס: נשלח בשיטת post, רץ בצד השרת, ומפעיל את פונקציית ה-JavaScript באירוע onsubmit --%>
    <form name="formPage" method="post" runat="server" style="text-align:right;" onsubmit="return checkAdd();">

        <%-- שדה קלט מסוג תגית טקסט (textarea) עבור שם השחקן --%>
        שם מלא של השחקן: 
        <textarea rows="1" cols="20" name="Name" id="textarea2" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        <%-- שדה קלט עבור גיל השחקן --%>
        גילו של השחקן: 
        <textarea rows="1" cols="20" name="Age" id="textarea3" placeholder="הכנס מלל חופשי"></textarea>                
        <br />
        <%-- שדה קלט עבור כמות הגביעים --%>
        גביעים שהשחקן זכה בהם:
        <textarea rows="1" cols="20" name="Trophies" id="textarea4" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        <%-- שדה קלט עבור קבוצות קודמות --%>
        קבוצות שהשחקן שיחק בהם חוץ מברצלונה: 
        <textarea rows="1" cols="20" name="Clubs" id="textarea5" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        <%-- שדה קלט עבור שחקן השראה --%>
        השחקן שנתן לו השראה: 
        <textarea rows="1" cols="20" name="Idol" id="textarea6" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        <br />
        <%-- כפתור מסוג submit שבלחיצה עליו מפעיל את אירוע שליחת הטופס --%>
        <input id="Submit1" type="submit" value="שלח" />
    </form>    
</asp:Content>