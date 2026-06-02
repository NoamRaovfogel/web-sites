<%-- שורת ההגדרה של הדף: קובעת כותרת דפדפן, מקשרת ל-MasterPage, מגדירה שפת שרת כ-C# ומפנה לקובץ ה-cs המתאים --%>
<%@ Page Title="קצת עלי" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="info.aspx.cs" Inherits="info" %>

<%-- פקד תוכן ה-head - מכיל את בלוק הסטייל (CSS) הייחודי לעיצוב דף האודות --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* תיבת התוכן המרכזית - משתמשת ברקע כהה שקוף למחצה כדי לאפשר קריאה חלקה על גבי תמונת הרקע הכללית */
        .about-container {
            background-color: rgba(0, 0, 0, 0.6); /* שימוש בערוץ Alpha לקבלת שקיפות של 60% לקוביה השחורה */
            border-radius: 12px; /* עיגול פינות התיבה למראה מודרני */
            padding: 30px; /* מרווח פנימי בין הטקסט לקצוות התיבה */
            box-shadow: 0 4px 20px rgba(0,0,0,0.5); /* הוספת צל היקפי שחור שנותן נפח ועומק לתיבה */
            color: #ffffff; /* הגדרת צבע הטקסט הכללי בתיבה לבן */
        }

        /* כותרת הדף המרכזית - צבועה בצבע הזהב הרשמי של מועדון ברצלונה */
        .about-title {
            color: #edbb00; /* גוון הזהב של בארסה */
            font-size: 34px; /* גודל פונט מובלט עבור כותרת ראשית */
            margin-bottom: 25px; /* מרווח תחתון המפריד בין הכותרת לטבלה */
            text-align: center; /* מרכוז הכותרת */
            text-shadow: 2px 2px 4px rgba(0,0,0,0.8); /* הוספת צל טקסט כהה כדי שהכותרת תקפוץ לעין */
        }

        /* עיצוב כותרות משניות בדף */
        .about-subtitle {
            color: #ff3366; /* צבע אדום בהיר ובולט ליצירת ניגודיות (קונטרסט) */
            font-size: 22px; /* גודל כותרת משנית */
            border-bottom: 2px solid #edbb00; /* יצירת קו תחתון מפריד בצבע זהב */
            padding-bottom: 5px; /* מרווח קטן בין הטקסט של הכותרת לקו התחתון */
            text-align: right; /* יישור הטקסט לימין (תואם עברית) */
            margin-top: 20px; /* מרווח עליון מפסקה קודמת */
        }

        /* עיצוב טבלה פנימית המשמשת ככלי פריסה (Layout) לסידור התמונה והטקסט זה לצד זה */
        .profile-table {
            width: 100%; /* פריסת הטבלה על פני כל רוחב התיבה המרכזית */
            border: none; /* ביטול מוחלט של גבולות הטבלה כדי שלא תיראה כמו טבלת נתונים */
            border-collapse: collapse; /* מיזוג שולי התאים למניעת מרווחים כפולים */
        }

        /* עמודת הטקסט החופשי בתוך טבלת הפריסה */
        .profile-td-text {
            width: 60%; /* תופסת 60 אחוז מהרוחב הכולל של הטבלה */
            text-align: right; /* יישור הטקסט לימין הולם עברית */
            vertical-align: top; /* הצמדת תוכן התא לחלק העליון כדי שיהיה מיושר עם ראש התמונה */
            padding-left: 20px; /* מרווח שמאלי למניעת נגיעה בתמונה הסמוכה */
        }

        /* עמודת תמונת הפרופיל בתוך טבלת הפריסה */
        .profile-td-img {
            width: 40%; /* תופסת את 40 האחוזים הנותרים מהרוחב */
            text-align: center; /* מרכוז התמונה והכיתוב שמתחתיה בתוך העמודה */
            vertical-align: top; /* הצמדת התמונה לחלק העליון */
        }

        /* עיצוב תמונת מפתח האתר - מבנה מלבני, ברור ומיוצב */
        .student-img {
            width: 280px;  /* הגדרת רוחב קבוע לתמונה */
            height: 360px; /* הגדרת גובה קבוע לתמונה */
            object-fit: cover; /* מניעת עיוות או מתיחה לא טבעית של התמונה תוך שמירה על יחס הגובה והרוחב המקוריים */
            border: 3px solid #edbb00; /* מסגרת זהב חיצונית התואמת את צבעי המועדון */
            border-radius: 8px; /* פינות מעוגלות קלות לעידון הקצוות */
            box-shadow: 0 6px 20px rgba(0,0,0,0.6); /* הצללה חזקה לתמונה כדי לתת לה אפקט תלת-ממדי מורם */
        }

        /* עיצוב פסקאות המלל הכלליות */
        .about-text {
            font-size: 16px; /* גודל טקסט קריא וסטנדרטי */
            line-height: 1.6; /* גובה שורה של 160% למניעת צפיפות בין שורות הטקסט */
        }

        /* עיצוב רשימת הבולטים המפרטת את הפרטים האישיים */
        .details-list {
            list-style-type: square; /* שינוי סימן הבולט הסטנדרטי לצורת ריבוע קטן */
            padding-right: 20px; /* הגדרת מרווח מימין (הזחה) עבור הבולטים בגלל הכתיבה בעברית */
            font-size: 16px; 
            line-height: 1.8; /* מרווח אנכי מעט רחב יותר בין פריט לפריט ברשימה */
        }

        /* הדגשת הטקסט (תגית strong) בתוך רשימת הפרטים */
        .details-list strong {
            color: #edbb00; /* צביעת כותרות השדות (כמו 'כיתה:', 'שם מלא:') בצבע הזהב */
        }
    </style>
</asp:Content>

<%-- פקד התוכן המרכזי המזריק את תוכן הדף אל תוך דף האב --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%-- קונטיינר עטיפה מרכזי המחיל את העיצוב הכהה השקוף --%>
    <div class="about-container">
        <%-- כותרת העמוד הראשית --%>
        <h1 class="about-title">אודות מפתח האתר</h1>

        <%-- טבלת הפריסה למבנה הדו-עמודתי (טקסט מימין, תמונה משמאל), ה-CSS מסיר את הגבולות --%>
        <table class="profile-table" style="border: none;">
            <tr style="border: none;">
                
                <%-- תא ימני: מכיל את פסקאות המלל ורשימת המידע הטכנולוגי --%>
                <td class="profile-td-text" style="border: none;">
                    <h3 class="about-subtitle">קצת עלי</h3>
                    <p class="about-text">
                        שלום לכולם! קוראים לי <strong>נועם</strong>, ואני תלמיד בכיתה י'. 
                        האתר הזה נבנה כפרויקט סיום מעשי במסגרת לימודי מדעי המחשב ופיתוח אתרי אינטרנט (HTML, CSS ו-ASP.NET).
                    </p>
                    <p class="about-text">
                        כחובב כדורגל מושבע ואוהד שרוף של מועדון הכדורגל ברצלונה, בחרתי להקדיש את הפרויקט שלי לקבוצה שאני הכי אוהב בעולם. 
                        במהלך בניית האתר יישמתי את כל הכלים שלמדנו בכיתה: עיצוב מתקדם, בניית גלריות, ניהול משתמשים ועבודה עם דפי אב (Master Pages).
                    </p>

                    <h3 class="about-subtitle">פרטים אישיים</h3>
                    <%-- רשימה לא ממוספרת (ul) המציגה את מפרט הטכנולוגיות והפרטים של נועם --%>
                    <ul class="details-list">
                        <li><strong>שם מלא:</strong> נועם</li>
                        <li><strong>כיתה:</strong> י'</li>
                        <li><strong>נושא הפרויקט:</strong> מועדון הכדורגל ברצלונה (FC Barcelona)</li>
                        <li><strong>סביבת פיתוח:</strong> Microsoft Visual Studio</li>
                        <li><strong>שפות תכנות ועיצוב:</strong> HTML5, CSS3, C# (ASP.NET)</li>
                    </ul>
                </td>

                <%-- תא שמאלי: מכיל את תמונת הפרופיל והכיתוב שמתחתיה --%>
                <td class="profile-td-img" style="border: none;">
                    <%-- פקד תמונה סטנדרטי השולף את הקובץ מתיקיית images באתר --%>
                    <img src="images/MyPicture.png" alt="נועם מפתח האתר" class="student-img" />
                    <%-- תיאור קצר וסמליל (Emoji) מתחת לתמונה בעיצוב אפרפר ונטוי --%>
                    <p style="margin-top: 12px; font-size: 14px; color: #cccccc; font-style: italic;">נועם - מפתח האתר 💻</p>
                </td>

            </tr>
        </table>

        <%-- קו מפריד אופקי מעוצב בגוון שקוף עדין שמפריד בין הבלוק המרכזי לחתימת הדף --%>
        <hr style="border: 0; height: 1px; background: rgba(255,255,255,0.2); margin: 25px 0;" />
        
        <%-- שורת חתימה תחתונה עם סיסמת האוהדים המפורסמת של בארסה --%>
        <p style="text-align: center; font-size: 16px; font-weight: bold; color: #edbb00;">
            "visca barca" | תודה שביקרתם בדף שלי!
        </p>
    </div>

</asp:Content>