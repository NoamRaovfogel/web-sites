using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה החלקית לפאנל הניהול היורשת ממחלקת הדפים הכללית של ASP.NET
public partial class managment : System.Web.UI.Page
{
    // משתנה מחרוזת ציבורי (public) שישמש לבניית והצגת טבלת ה-HTML הדינמית במסך
    public string st = "";

    // פעולה המתבצעת אוטומטית בכל טעינה של הדף בשרת
    protected void Page_Load(object sender, EventArgs e)
    {
        // אבטחת עמוד ניהול (קריטי לבגרות): בדיקה האם משתנה ה-Session של הניהול אינו מאושר
        if (Session["nihol"] != "ok")
        {
            // חסימת הגעה לעמוד ואבטחת המידע - העברה מיידית של האורח/המשתמש הרגיל חזרה לדף הבית!
            Response.Redirect("home.aspx");
        }

        // הגדרת ברירת מחדל: שאילתת בסיס לשליפת כל הרשומות מטבלת המשתמשים tUsers (יוצג בטעינה הראשונה)
        string sqlSelect = "SELECT * FROM tUsers";

        // בדיקה האם המנהל ביצע פעולת שליחה של טופס החיפוש (PostBack) - אם כן, נבנה שאילתה מסוננת
        if (Page.IsPostBack)
        {
            // קליטת הערכים שהוזנו בשדות החיפוש והסינון מתוך מערך Request.Form
            string Name = Request.Form["name"];

            // מניעת שבירת SQL (הגנה בסיסית): החלפת גרש בודד בגרש כפול במידה והוזן, כדי שהשאילתה לא תישבר
            if (Name != null)
            {
                Name = Name.Replace("'", "''");
            }
            string Players = Request.Form["check2"];

            // בניית שאילתה דינמית תוך שימוש בפקודת LIKE ובסימני האחוז (%) המאפשרים למצוא כל שם שמכיל את המחרוזת
            // האות N תומכת בחיפוש תקין בעברית. הסוגריים המרובעים [Name] מונעים התנגשות עם מילים שמורות של SQL
            sqlSelect = "SELECT * FROM tUsers WHERE [Name] LIKE N'%" + Name + "%'";

            // תנאי הבודק האם נבחר שחקן לסינון (תיבת הסימון אינה ריקה)
            if (!string.IsNullOrEmpty(Players))
            {
                // שרשור והוספת תנאי נוסף (AND) לשאילתת הסינון הקיימת לפי שדה השחקנים
                sqlSelect += " AND [FootballPlayers] LIKE N'%" + Players + "%'";
            }
        }

        // הרצת השאילתה הסופית (בכל מקרה: בין אם כניסה ראשונית ובין אם לאחר חיפוש) ושמירת התוצאות ב-DataTable
        DataTable dt = MyAdoHelper.ExecuteDataTable(sqlSelect);

        // בדיקה האם הטבלה שחזרה ריקה מרשומות (לא נמצאו משתמשים העונים לקריטריונים)
        if (dt.Rows.Count == 0)
        {
            // עדכון מחרוזת ה-st בהודעת שגיאה מעוצבת באדום
            st = "<h3 style='color:red; text-align:center;'>לא נמצאו משתמשים תואמים לחיפוש</h3>";
        }
        else // אם נמצאו רשומות, נתחיל בבנייה דינמית של טבלת ה-HTML
        {
            // פתיחת תגית הטבלה והגדרת מאפייני עיצוב (גבול, כיוון ימין לשמאל, רוחב וצבעים)
            st += "<table border='1' dir='rtl' style='margin: 0 auto; text-align: center; background-color: white; color: black; width: 90%;'>";

            // בניית שורת הכותרות של הטבלה (th)
            st += "<tr>";
            st += "<th>שם פרטי ושם משפחה</th>";
            st += "<th>אימייל</th>";
            st += "<th>סיסמה</th>"; // הכותרת של עמודת הסיסמה
            st += "<th>מספר טלפון</th>";
            st += "<th>שחקני כדורגל</th>";
            st += "<th>מאמן כדורגל</th>";
            st += "<th>עדכונים</th>";
            st += "<th>תקנון</th>";
            st += "<th>גיל</th>";
            st += "</tr>";

            // לולאה חיצונית: רצה על פני השורות (Rows) שחזרו ממסד הנתונים
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st += "<tr>"; // פתיחת שורה חדשה בטבלת ה-HTML עבור כל משתמש

                // לולאה פנימית (לולאה מקוננת): רצה על פני העמודות (Columns) של אותה שורה
                for (int k = 0; k < dt.Columns.Count; k++)
                {
                    st += "<td>"; // פתיחת תא חדש בטבלה

                    // תיקון מחוון אבטחה קריטי: בדיקה האם הלולאה הגיעה לעמודה שמחזיקה את הסיסמה (אינדקס 2)
                    if (k == 2)
                    {
                        st += "******"; // הסתרת הסיסמה האמיתית והצגת כוכביות במקומה לשמירה על פרטיות
                    }
                    else // עבור שאר העמודות שאינן סיסמה
                    {
                        // שליפת הנתון הספציפי מהשורה i והעמודה k והפיכתו למחרוזת טקסט
                        st += dt.Rows[i][k].ToString();
                    }

                    st += "</td>"; // סגירת התא
                }
                st += "</tr>"; // סגירת השורה הנוכחית של המשתמש
            }
            st += "</table>"; // סגירת הטבלה כולה לאחר סיום הלולאות
        }
    }
}