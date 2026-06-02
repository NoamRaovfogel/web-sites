<%-- שורת ההגדרה של הדף: מקשרת ל-MasterPage, קובעת את כותרת הלשונית "גלריית תמונות", ומפנה לקובץ השרת gallery.aspx.cs --%>
<%@ Page Title="גלריית תמונות" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="gallery" %>

<%-- פקד תוכן המזריק את קוד ה-CSS הייחודי של הגלריה ישירות לתוך ה-head של דף האב --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* המכל הראשי של הגלריה */
        .gallery-container {
            display: grid; /* הפעלת מודל ה-Grid (רשת) המאפשר לסדר אלמנטים בדו-ממד (שורות ועמודות) */
            grid-template-columns: repeat(3, 1fr); /* חלוקת הרשת ל-3 עמודות שוות בדיוק, כאשר fr מייצג חלק יחסי מהרווח הפנוי */
            gap: 20px; /* קביעת מרחק ורווח נקי של 20 פיקסלים בין האריחים והשורות ברשת */
            width: 90%; /* הגדרת רוחב מכל הגלריה ל-90 אחוז מרוחב המסך הזמין */
            margin: 30px auto; /* יצירת רווח חיצוני של 30 פיקסלים מלמעלה ומלמטה, ומרכז אוטומטי (auto) מהצדדים */
        }

        /* הכרטיס (המשבצת) שמחזיק את התמונה */
        .gallery-card {
            width: 100%; /* הכרטיס יתפוס את כל הרוחב של העמודה שבה הוא נמצא ברשת */
            height: 250px; /* קביעת גובה אחיד וקבוע של 250 פיקסלים לכל האריחים בגלריה ליצירת סדר ואיזון ויזואלי */
            border-radius: 8px; /* עיגול פינות הכרטיס ברדיוס של 8 פיקסלים */
            overflow: hidden; /* קריטי: הסתרת כל תוכן שחורג מגבולות הכרטיס, דואג שהתמונה לא תכסה או תברח מהפינות המעוגלות */
            box-shadow: 0 4px 12px rgba(0,0,0,0.1); /* הוספת צל עדין, קל ויוקרתי מתחת לכל כרטיס תמונה */
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* הגדרת מעבר חלק ובקצב טבעי (ease) של 0.3 שניות לאפקט הריחוף */
            cursor: pointer; /* שינוי סמן העכבר לצורת יד לחיצה כדי לסמן לגולש שהאלמנט אינטראקטיבי */
        }

        /* עיצוב התמונה - עכשיו היא תופסת את כל השטח! */
        .gallery-item {
            width: 100%; /* התמונה תתפרס על פני 100% מרוחב הכרטיס המכיל אותה */
            height: 100%; /* התמונה תתפרס על פני 100% מגובה הכרטיס המכיל אותה */
            object-fit: cover; /* פקודת הזהב: התמונה מתרחבת ומכסה את כל שטח הכרטיס בלי לאבד פרופורציות או להתעוות */
            display: block; /* הפיכת התמונה לאלמנט בלוק כדי למנוע רווחים לבנים קטנים ומיותרים מתחתיה */
        }

        /* אפקט ריחוף שמקפיץ את האריח ונותן הילה של בארסה */
        .gallery-card:hover {
            transform: translateY(-5px); /* הזזת הכרטיס 5 פיקסלים למעלה ברגע שהעכבר עובר מעליו ליצירת אפקט הרמה */
            box-shadow: 0 12px 22px rgba(237, 187, 0, 0.4); /* הגדלת הצל והפיכתו להילת זהב רכה בגוון ברצלונה */
        }
    </style>
</asp:Content>

<%-- פקד תוכן המזריק את מבנה ה-HTML של הגלריה לתוך ה-ContentPlaceHolder המרכזי של דף האב --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <%-- המכל המרכזי שמפעיל את חוקי הרשת (Grid) --%>
    <div class="gallery-container">
        
        <%-- אריחי הגלריה - כל אריח מורכב מכרטיס מעטפת ותמונה פנימית עם תיאור חלופי (alt) --%>
        <div class="gallery-card">
            <img src="images/barca1.png" alt="ברצלונה 1" class="gallery-item" />
        </div>

        <div class="gallery-card">
            <img src="images/barca2.png" alt="ברצלונה 2" class="gallery-item" />
        </div>

        <div class="gallery-card">
            <img src="images/barca3.png" alt="ברצלונה 3" class="gallery-item" />
        </div>

        <div class="gallery-card">
            <img src="images/barca4.png" alt="ברצלונה 4" class="gallery-item" />
        </div>

        <div class="gallery-card">
            <img src="images/barca5.png" alt="ברצלונה 5" class="gallery-item" />
        </div>

        <div class="gallery-card">
            <img src="images/barca6.png" alt="ברצלונה 6" class="gallery-item" />
        </div>

    </div>

</asp:Content>