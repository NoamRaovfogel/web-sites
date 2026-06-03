using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה החלקית של דף הצגת השחקנים היורשת ממחלקת הדפים הכללית של ASP.NET
public partial class ShowPlayers : System.Web.UI.Page
{
    // משתנה מחרוזת ציבורי (public) שישמש לבניית והצגת טבלת ה-HTML בצד הלקוח
    public string st = "";

    // פעולה המתבצעת אוטומטית בכל טעינה של הדף בשרת
    protected void Page_Load(object sender, EventArgs e)
    {
        // חובה במחוון: אבטחת עמודים - חסימת אורחים. גישה מותרת אך ורק למשתמש רשום או למנהל מערכת
        if (Session["nihol"] != "ok" && Session["user"] != "ok")
        {
            // אם הגולש הוא אורח לא מחובר, הוא נחסם ומועבר מיד חזרה לדף הבית
            Response.Redirect("home.aspx");
        }

        // הגדרת שאילתת ברירת המחדל: שליפת כל הרשומות מטבלת השחקנים Tbarca (כדי שהדף לא יוצג ריק בהתחלה)
        string sql = "SELECT * FROM Tbarca";

        // חובה במחוון: ביצוע החיפוש - בדיקה האם נשלח ערך חיפוש בטופס והוא אינו ריק
        if (Request.Form["searchName"] != null && Request.Form["searchName"] != "")
        {
            // שמירת מחרוזת החיפוש שהתקבלה מהמשתמש
            string search = Request.Form["searchName"];

            // תיקון: הוספת האות N לפני הגרש כדי לתמוך בחיפוש בעברית (Unicode)
            sql = "SELECT * FROM Tbarca WHERE Name LIKE N'%" + search + "%'";
        }

        // הרצת השאילתה מול קובץ מסד הנתונים ושמירת הרשומות שחזרו בתוך אובייקט DataTable בזיכרון
        DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

        // בדיקה האם חזרו שורות/רשומות מהמסד (כלומר נמצאו שחקנים העונים לתנאי השאילתה)
        if (dt.Rows.Count > 0)
        {
            // תחילת בנייה דינמית של טבלת ה-HTML: פתיחת תגית והגדרת מאפייני גבול, כיוון ימין לשמאל ועיצוב
            st += "<table border='1' dir='rtl' style='margin: 0 auto; text-align: center; background-color: white; color: black; width: 80%;'>";

            // יצירת שורת הכותרות המרכזית של הטבלה (th)
            st += "<tr><th>שם השחקן</th><th>גיל</th><th>גביעים</th><th>קבוצות עבר</th><th>השראה</th></tr>";

            // לולאה הרצה על פני כל השורות (Rows) המצויות ב-DataTable
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st += "<tr>"; // פתיחת שורה חדשה בטבלת ה-HTML עבור כל שחקן

                // שליפת הנתונים מכל עמודה בשורה הנוכחית (i) לפי אינדקס העמודה בטבלה [1] עד [5], והפיכתם לטקסט
                st += "<td>" + dt.Rows[i][1].ToString() + "</td>"; // עמודה 1: שם השחקן
                st += "<td>" + dt.Rows[i][2].ToString() + "</td>"; // עמודה 2: גיל השחקן
                st += "<td>" + dt.Rows[i][3].ToString() + "</td>"; // עמודה 3: כמות הגביעים
                st += "<td>" + dt.Rows[i][4].ToString() + "</td>"; // עמודה 4: קבוצות עבר
                st += "<td>" + dt.Rows[i][5].ToString() + "</td>"; // עמודה 5: שחקן השראה

                st += "</tr>"; // סגירת שורת השחקן הנוכחי
            }
            st += "</table>"; // סגירת הטבלה כולה לאחר סיום הלולאה
        }
        else // אם לא חזרו שורות ממסד הנתונים (dt.Rows.Count == 0)
        {
            // עדכון מחרוזת ה-st בהודעה מתאימה למשתמש
            st = "לא נמצאו שחקנים התואמים לחיפוש שלך.";
        }
    }
}