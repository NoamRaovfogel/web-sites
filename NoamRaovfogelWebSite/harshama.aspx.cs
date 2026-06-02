using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה של דף ההרשמה היורשת ממחלקת הדפים הסטנדרטית של השרת
public partial class harshama : System.Web.UI.Page
{
    // משתנה מחרוזת ציבורי המשמש להעברת הודעות שגיאה מצד השרת ישירות לתצוגת ה-HTML
    public string st = "";

    // פונקציית אירוע המופעלת אוטומטית ברגע שהדף נטען בשרת
    protected void Page_Load(object sender, EventArgs e)
    {
        // תיקון מחוון: אבטחה המונעת ממשתמש שכבר מחובר (רשום או מנהל) מלבצע הרשמה מחדש
        if (Session["user"] == "ok" || Session["nihol"] == "ok")
        {
            // העברת המשתמש המחובר באופן אוטומטי חזרה לדף הבית
            Response.Redirect("home.aspx");
        }

        // בדיקה האם הגענו לדף בעקבות לחיצה על כפתור השליחה של הטופס (PostBack)
        if (Page.IsPostBack)
        {
            // קליטת הנתונים שנשלחו מהרכיבים השונים בטופס ה-HTML באמצעות מערך Request.Form לפי ה-name שלהם
            string Name = Request.Form["name"];
            string Email = Request.Form["email"];
            string Password = Request.Form["Password"];
            string PhoneNumber = Request.Form["phonenumber"];
            string Players = Request.Form["players"]; // בתיבות סימון, אם נבחרו כמה, הערכים יתקבלו מופרדים בפסיקים
            string Coach = Request.Form["radio1"];
            string Updates = Request.Form["updates"];
            string Regulations = Request.Form["radio2"];
            string Age = Request.Form["age"];

            // בדיקת הגנה למניעת שגיאות טיפוס במסד הנתונים במידה והגיל לא הגיע בצורה תקינה
            if (string.IsNullOrEmpty(Age) || Age == "0")
            {
                Age = "0"; // הגדרת ערך ברירת מחדל מספרי למניעת כשל בשאילתה
            }

            // שאילתת SELECT שמטרתה לבדוק האם קיים כבר משתמש רשום עם אותו אימייל שהוזן כעת
            string sqlSelect =
                "SELECT * FROM tUsers " +
                " WHERE Email = N'" + Email + "'";

            // הרצת הבדיקה באמצעות מחלקת עזר שמחזירה אמת (true) אם המייל כבר תפוס ומצוי במסד הנתונים
            bool userExists = MyAdoHelper.IsExist(sqlSelect);

            if (userExists)
                // תיקון מחוון: עדכון הודעה ברורה למשתמש כדי למנוע יצירת רשומות כפולות באותו אימייל
                st = "מייל זה כבר קיים במערכת";
            else // אם המייל ייחודי ואינו קיים, נבצע את תהליך רישום המשתמש החדש
            {
                // תיקון קריסת SQL חיוני: הוספת שמות העמודות במפורש (Name, Email, Password...) 
                // זה מונע מהשרת לנסות להכניס ערכים לתוך עמודת ה-UserId שהיא עמודת מספור אוטומטי (Identity) ומקריסה את הדף
                // האות N לפני הגרש הבודד (למשל 'N'") מוודא שהטקסט בעברית יישמר בצורה תקינה (Unicode)
                string sqlinsert =
                "insert into tUsers (Name, Email, Password, PhoneNumber, FootballPlayers, FootballCoach, Updates, Regulations, Age)" +
                " values (" +
                "N'" + Name + "'," +
                "N'" + Email + "'," +
                "N'" + Password + "'," +
                "N'" + PhoneNumber + "'," +
                "N'" + Players + "'," +
                "N'" + Coach + "'," +
                "N'" + Updates + "'," +
                "N'" + Regulations + "'," +
                 Age +
                 ")";

                // הרצת שאילתת ההוספה (INSERT) על קובץ מסד הנתונים MyDb.mdf באמצעות מחלקת העזר
                MyAdoHelper.DoQuery("MyDb.mdf", sqlinsert);

                // תיקון מחוון: לאחר רישום מוצלח, המערכת מעבירה את הגולש ישירות לדף ההתחברות (entrance) כדי שיבצע אימות
                Response.Redirect("entrance.aspx");
            }
        }
    }
}