<%-- שורת ההגדרה של הדף: מקשרת ל-MasterPage, מגדירה את שפת השרת ומפנה לקובץ ה-CS המתאים --%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="harshama.aspx.cs" Inherits="harshama" %>

<%-- פקד תוכן ה-head: מכיל את פונקציות ה-JavaScript לבדיקת תקינות הקלטים לפני שהטופס בכלל נשלח לשרת --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript">

    // פונקציית העל המרכזת שמפעילה את כל הבדיקות הפרטניות עבור שדות הטופס
    function checkAll() {
        // איפוס מראש של כל תגיות השגיאה (span) כדי לנקות הודעות ישנות מסבב בדיקה קודם
        nameErr2.innerHTML = "";
        emailErr2.innerHTML = "";
        PasswordErr2.innerHTML = "";
        PhoneNumberErr2.innerHTML = "";
        AgeErr2.innerHTML = "";
        FavoritesErr2.innerHTML = "";
        CoachErr2.innerHTML = "";
        TermsErr2.innerHTML = "";
        UpdatesErr2.innerHTML = ""; // תיקון מחוון: איפוס שגיאת הערות

        // הגדרת משתנה דגל (Flag) שמתחיל כ-'אמת'
        result = true;

        // הפעלת בדיקת שם ועדכון הדגל במידה ונכשלה
        if (CheckFirstName() == false)
            result = false;

        // הפעלת בדיקת פורמט ורוחב אימייל
        if (CheckEmail() == false)
            result = false;

        // הפעלת בדיקת חוזק ואורך סיסמה
        if (CheckPassword() == false)
            result = false;

        // הפעלת בדיקת מבנה מספר טלפון
        if (CheckPhoneNumber() == false)
            result = false;

        // הפעלת בדיקה שנבחר גיל חוקי מהתפריט
        if (CheckAge() == false)
            result = false;

        // הפעלת בדיקה שלפחות תיבת סימון (Checkbox) אחת של שחקן סומנה
        if (CheckFavorites() == false)
            result = false;

        // הפעלת בדיקה שכפתור רדיו אחד של מאמן נבחר
        if (CheckCoach() == false)
            result = false;

        // הפעלת בדיקה שכפתור הרדיו של אישור התקנון סומן כ-'כן'
        if (CheckTerms() == false)
            result = false;

        // תיקון מחוון: בדיקת השדה האחרון (הערות/עדכונים) להשלמת בדיקה לכל רכיבי הטופס
        if (CheckUpdates() == false)
            result = false;

        // החזרת התוצאה הסופית: אם אחד מהתנאים נכשל יוחזר false והטופס לא יישלח לשרת
        return result;
    }

    // פונקציה לבדיקת שדה השם
    function CheckFirstName() {
        name = document.getElementById("name").value; // שליפת הערך מהשדה בשם name
        if (name.length < 2) { // בדיקה שהשם מכיל לפחות 2 אותיות
            nameErr2.innerHTML = "שם חייב להכיל לפחות שני תווים";
            return false;
        }
        if (name.length > 20) { // הגבלת אורך מקסימלי ל-20 תווים
            nameErr2.innerHTML = "שם ארוך מדי";
            return false;
        }
        return true; // הקלט תקין
    }

    // פונקציה לבדיקת שדה האימייל
    function CheckEmail() {
        email = document.getElementById("email").value;

        if (email.length < 8) { // אורך מינימלי למייל חוקי
            emailErr2.innerHTML = "אימייל קצר מדי";
            return false;
        }
        if (email.length > 35) { // מניעת הצפת אורך במסד הנתונים
            emailErr2.innerHTML = "אימייל ארוך מדי";
            return false;
        }
        if (email.includes("@") == false) { // בדיקת קיום חובה של סימן השטרודל במחרוזת
            emailErr2.innerHTML = "חייב לכלול @ באימייל";
            return false;
        }
        return true;
    }

    // פונקציה לבדיקת שדה הסיסמה
    function CheckPassword() {
        Password = document.getElementById("Password").value;

        if (Password.length < 8) { // אכיפת אורך מינימלי לסיסמה מאובטחת
            PasswordErr2.innerHTML = "סיסמה קצרה מדי";
            return false;
        }
        if (Password.length > 12) { // הגבלת אורך מקסימלי התואם לטבלה ב-DB
            PasswordErr2.innerHTML = "סיסמה ארוכה מדי";
            return false;
        }
        return true;
    }

    // פונקציה לבדיקת שדה מספר הטלפון
    function CheckPhoneNumber() {
        phoneNumber = document.getElementById("phonenumber").value;

        if (phoneNumber.length != 10) { // וידוא אורך מדויק של 10 ספרות (כולל קידומת)
            PhoneNumberErr2.innerHTML = "מספר טלפון חייב להכיל בדיוק 10 ספרות";
            return false;
        }

        if (isNaN(phoneNumber) == true) { // וידוא שהקלט מורכב מספרות בלבד ולא מאותיות
            PhoneNumberErr2.innerHTML = "מספר טלפון חייב להכיל מספרים בלבד";
            return false;
        }
        return true;
    }

    // פונקציה לבדיקת בחירת הגיל
    function CheckAge() {
        age = document.getElementById("age").value;

        if (age == "0") { // אם ערך האופציה שנבחרה נשאר "0", סימן שהמשתמש דילג על הבחירה
            AgeErr2.innerHTML = "יש לבחור גיל";
            return false;
        }
        return true;
    }

    // פונקציה לבדיקת בחירת תיבות סימון (Checkboxes) - שחקנים אהובים
    function CheckFavorites() {
        // בדיקת מצב הסימון (checked) של כל אחת מתיבות הסימון
        c1 = document.getElementById("check_1").checked;
        c2 = document.getElementById("check_2").checked;
        c3 = document.getElementById("check_3").checked;
        c4 = document.getElementById("check_4").checked;

        if (!c1 && !c2 && !c3 && !c4) { // תנאי הבודק אם אף תיבה לא סומנה (כולן שוות ל-false)
            FavoritesErr2.innerHTML = "יש לבחור שחקן";
            return false;
        }
        return true;
    }

    // פונקציה לבדיקת לחצני רדיו (Radio Buttons) - מאמן אהוב
    function CheckCoach() {
        // רדיו מאפשר בחירה של ערך בודד בלבד מתוך קבוצה בעלת אותו name
        r1 = document.getElementById("radio_1").checked;
        r2 = document.getElementById("radio_2").checked;
        r3 = document.getElementById("radio_3").checked;
        r4 = document.getElementById("radio_4").checked;

        if (!r1 && !r2 && !r3 && !r4) { // וידוא שלפחות אחד מכפתורי הרדיו של המאמנים נבחר
            CoachErr2.innerHTML = "יש לבחור מאמן";
            return false;
        }
        return true;
    }

    // פונקציה לבדיקת לחצני רדיו - אישור תקנון
    function CheckTerms() {
        yes = document.getElementById("radio_7").checked; // בדיקה האם סומן כפתור הרדיו "כן" של התקנון

        if (!yes) { // אם המשתמש סימן "לא" או לא סימן כלל - ההרשמה נחסמת
            TermsErr2.innerHTML = "חובה לאשר תקנון";
            return false;
        }
        return true;
    }

    // תיקון מחוון: פונקציה שמבטיחה שכל השדות באתר ללא יוצא מן הכלל עוברים בדיקה (בדיקת שדה ה-textarea)
    function CheckUpdates() {
        updates = document.getElementById("textarea1").value;
        if (updates.length > 150) { // הגבלת אורך הטקסט החופשי ל-150 תווים למניעת חריגת גודל עמודה ב-SQL
            UpdatesErr2.innerHTML = "שדה ההערות מוגבל ל-150 תווים בלבד";
            return false;
        }
        return true;
    }

</script>
</asp:Content>

<%-- פקד התוכן המרכזי - הזרקת מבנה HTML של הטופס לדף האב --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center>
    <h1>הרשמה</h1>
    <%-- תגית המציגה באופן דינמי שגיאות שחזרו מהשרת (כמו "מייל זה כבר קיים במערכת") באמצעות משתנה השרת st --%>
    <h3 style="color:red;"><%=st %></h3> 
</center>

<h1 style="text-align:right;">האתר הרשמי של אוהדי ברצלונה</h1>

<%-- הגדרת הטופס: שימוש בכיוון כתיבה מימין לשמאל (dir="rtl"), הפעלת הפונקציה checkAll באירוע onsubmit --%>
<form name="formPage" method="post" runat="server" dir="rtl" style="margin-right: 0;" onsubmit="return checkAll();">

<b>שם פרטי ושם משפחה:</b>  
<input type="text" id="name" name="name">
<span id="nameErr2" style="color:red;"></span> <%-- אלמנט Span להצגת הודעת שגיאה ממוקדת בצבע אדום --%>
<br /><br />

<b>אימייל:</b>  
<input type="text" id="email" name="email">
<span id="emailErr2" style="color:red;"></span>
<br /><br />

<b>סיסמה:</b>  
<input type="password" id="Password" name="Password">
<span id="PasswordErr2" style="color:red;"></span>
<br /><br />

<b>מספר טלפון:</b>  
<input type="text" id="phonenumber" name="phonenumber">
<span id="PhoneNumberErr2" style="color:red;"></span>
<br /><br />

<%-- קבוצת פקדי קלט מסוג תיבת סימון (Checkbox) המאפשרת בחירה מרובה של ערכים --%>
<b>שחקני כדורגל אהובים:</b><br />
מסי <input type="checkbox" name="players" value="מסי" id="check_1"><br />
ניימאר <input type="checkbox" name="players" value="ניימאר" id="check_2"><br />
ראפיניה <input type="checkbox" name="players" value="ראפיניה" id="check_3"><br />
פדרי <input type="checkbox" name="players" value="פדרי" id="check_4"><br />
<span id="FavoritesErr2" style="color:red;"></span>

<br /><br />

<%-- קבוצת פקדי קלט מסוג לחצן רדיו (Radio) בעלי שם זהה (radio1) המאפשרים בחירת ערך יחיד בלבד --%>
<b>מאמן כדורגל אהוב:</b><br />
האנסי פליק <input type="radio" name="radio1" value="האנסי פליק" id="radio_1"><br />
רונלד קואמן <input type="radio" name="radio1" value="רונלד קואמן" id="radio_2"><br />
צ'אבי הרננדז <input type="radio" name="radio1" value="צ'אבי הרננדז" id="radio_3"><br />
לואיס אנריקה <input type="radio" name="radio1" value="לואיס אנריקה" id="radio_4"><br />
<span id="CoachErr2" style="color:red;"></span>

<br /><br />

<b>האם אתה מאשר את התקנון:</b><br />
כן <input type="radio" name="radio2" value="כן" id="radio_7"><br />
לא <input type="radio" name="radio2" value="לא" id="radio_8"><br />
<span id="TermsErr2" style="color:red;"></span>

<br /><br />

<%-- פקד תפריט נפתח (Select/Drop-down) לבחירת גיל --%>
<select id="age" name="age">
    <option value="0">בחר גיל</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
</select>
<span id="AgeErr2" style="color:red;"></span>

<br /><br />

<%-- פקד תיבת טקסט גדולה (textarea) להזנת הערות חופשיות מרובות שורות --%>
<b>הערות / עדכונים:</b><br />
<textarea id="textarea1" name="updates" rows="4" cols="30"></textarea>
<span id="UpdatesErr2" style="color:red;"></span>

<br /><br />

<%-- כפתור שליחת הטופס הראשי --%>
<input type="submit" value="שלח" style="padding: 5px 15px; cursor: pointer;">

</form>

</asp:Content>