using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה של דף ההתחברות היורשת ממחלקת הדפים הרשמית של השרת
public partial class entrance : System.Web.UI.Page
{
    // משתנה מחרוזת ציבורי (public) שישמש להצגת תוצאת הבדיקה או הודעות שגיאה ישירות בדף ה-HTML
    public string stResult = "";

    // פעולה המתבצעת אוטומטית ברגע שהדף נטען בשרת
    protected void Page_Load(object sender, EventArgs e)
    {
        // אבטחה (דרישת מחוון): חסימת משתמשים שכבר מחוברים (רשומים או מנהלים) מלהגיע שוב לדף ההתחברות
        if (Session["user"] == "ok" || Session["nihol"] == "ok")
        {
            // אם המשתמש כבר מחובר, הוא מועבר אוטומטית חזרה לדף הבית
            Response.Redirect("home.aspx");
        }

        // בדיקה האם הגענו לדף כתוצאה לחיצה על כפתור השליחה של הטופס (PostBack)
        if (Page.IsPostBack)
        {
            // קליטת הנתונים שהקליד הגולש בשדות האימייל והסיסמה מתוך מערך Request.Form
            string email = (Request.Form["gmail"] ?? "").Replace("'", "''");
            string password = (Request.Form["Password"] ?? "").Replace("'", "''");
            // בדיקה מיוחדת (Hard-Coded) האם הפרטים שהוזנו תואמים בדיוק לפרטי מנהל המערכת (נועם)
            if (email == "NoamRaovfogel@1234gmail.com" && password == "Noam5432")
            {
                // הגדרת משתני ה-Session הייחודיים למנהל כדי שהאתר יזהה אותו לאורך כל הגלישה
                Session["nihol"] = "ok"; // משתנה המסמן שהוא מנהל
                Session["name"] = "היי נועם המנהל"; // שמירת שם המנהל להצגה בכותרת

                // העברת המנהל ישירות לדף ניהול המערכת
                Response.Redirect("managment.aspx");
            }
            else // אם הפרטים אינם של המנהל, נבדוק האם מדובר במשתמש רשום הקיים במסד הנתונים
            {
                // בניית שאילתת SQL מסוג SELECT כדי לחפש משתמש בטבלת tUsers שהאימייל והסיסמה שלו תואמים למה שהוקלד
                // האות N תומכת בטקסט בעברית במידה ויש במסד הנתונים
                string sqlSelect =
                "SELECT * FROM tUsers " +
                " WHERE Email = N'" + email + "' and Password = N'" + password + "'";

                // הרצת השאילתה דרך מחלקת העזר ושמירת התוצאה (השורות שנמצאו) בתוך אובייקט מסוג DataTable (טבלה בזיכרון)
                System.Data.DataTable dt = MyAdoHelper.ExecuteDataTable(sqlSelect);

                // בדיקה האם הטבלה שחזרה מהמסד ריקה (כלומר, לא נמצאה אף שורה שמתאימה לאימייל והסיסמה האלו)
                if (dt.Rows.Count == 0)
                {
                    // חובה במחוון: עדכון הודעת שגיאה מתאימה למשתמש במידה והפרטים שגויים
                    stResult = "אימייל או סיסמה שגויים, נסה שנית";
                    Session["name"] = "היי אורח"; // השארת הגדרת המשתמש כאורח במערכת
                }
                else // אם נמצאה שורה (dt.Rows.Count > 0), זה אומר שהמשתמש קיים והפרטים נכונים
                {
                    // הגדרת משתני ה-Session עבור המשתמש הרשום שמצאנו
                    Session["user"] = "ok"; // משתנה המסמן שהמשתמש מחובר בהצלחה
                    Session["name"] = dt.Rows[0]["Name"]; // שליפת השם הפרטי של המשתמש מהשורה הראשונה שנמצאה (אינדקס 0)

                    // העברת המשתמש המחובר באופן אוטומטי לדף הבית
                    Response.Redirect("home.aspx");
                }

            }
        }
    }
}