using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה החלקית של דף הוספת פריט, היורשת ממחלקת הדפים הכללית
public partial class Add : System.Web.UI.Page
{
    // פעולה המתבצעת בכל פעם שהדף נטען בשרת
    protected void Page_Load(object sender, EventArgs e)
    {
        // אבטחה וחסימת גישה: בודק האם המשתמש אינו מנהל וגם אינו משתמש רשום (כלומר הוא אורח)
        if (Session["nihol"] != "ok" && Session["user"] != "ok")
        {
            // אם המשתמש הוא אורח, הוא נחסם ומועבר באופן אוטומטי חזרה לדף הבית
            Response.Redirect("home.aspx");
        }

        // בדיקה האם הדף נטען כתוצאה משליחת טופס (PostBack) ולא מטעינה ראשונית של הדף
        if (Page.IsPostBack)
        {
            // קליטת הנתונים שנשלחו מה-textareas שבטופס באמצעות מערך Request.Form לפי ה-name שלהם
            string Name = Request.Form["Name"];
            string Age = Request.Form["Age"];
            string Trophies = Request.Form["Trophies"];
            string Clubs = Request.Form["Clubs"];
            string Idol = Request.Form["Idol"];

            // הגנה: בדיקה האם משתנה הגיל ריק או שווה לערך null כדי למנוע שגיאות במסד הנתונים
            if (string.IsNullOrEmpty(Age))
            {
                Age = "0"; // הפיכת הערך הריק ל-0 (מתאים לשדה מסוג מספר ב-SQL)
            }

            // הגנה על שדה הגביעים כי הוא מסוג INT (מספר שלם) במסד הנתונים
            if (string.IsNullOrEmpty(Trophies))
            {
                Trophies = "0"; // הפיכת הערך הריק ל-0 למניעת שבירת השאילתה
            }

            // בניית שאילתת SQL מסוג INSERT להוספת שורה חדשה עם נתוני השחקן לטבלה Tbarca
            // האות N לפני הגרש הבודד (למשל 'N'") נועדה לתמוך בשדות טקסט בעברית (Unicode) במסד הנתונים
            string sqlInsert = "INSERT INTO Tbarca(Name , Age , Trophies , Clubs , Idol) VALUES (" +
                               "N'" + Name + "', " +
                               Age + ", " +
                               Trophies + ", " +
                               "N'" + Clubs + "', " +
                               "N'" + Idol + "')";

            // שליחת השאילתה הכתובה לקובץ העזר MyAdoHelper שיבצע אותה על קובץ מסד הנתונים MyDb.mdf
            MyAdoHelper.DoQuery("MyDb.mdf", sqlInsert);

            // הפניה חזרה לדף הבית לאחר ביצוע השמירה בהצלחה (כדי שהמשתמש לא יראה דף ריק)
            Response.Redirect("showplayers.aspx");
        }
    }
}