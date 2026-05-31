using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // תיקון מחוון: חסימת אורחים בלבד. מנהל ומשתמש רשום מורשים להיות כאן!
        if (Session["nihol"] != "ok" && Session["user"] != "ok")
        {
            Response.Redirect("home.aspx");
        }

        if (Page.IsPostBack)
        {
            // קליטת הנתונים מה-textareas שבטופס
            string Name = Request.Form["Name"];
            string Age = Request.Form["Age"];
            string Trophies = Request.Form["Trophies"];
            string Clubs = Request.Form["Clubs"];
            string Idol = Request.Form["Idol"];

            // הגנה: מניעת שבירת ה-SQL אם השדה נשאר ריק (הפיכה ל-0)
            if (string.IsNullOrEmpty(Age))
            {
                Age = "0";
            }

            // הגנה על שדה הגביעים כי הוא מסוג INT
            if (string.IsNullOrEmpty(Trophies))
            {
                Trophies = "0";
            }

            // שאילתת הוספה מעודכנת לטבלה Tbarca
            string sqlInsert = "INSERT INTO Tbarca VALUES (" +
                               "N'" + Name + "', " +
                               Age + ", " +
                               Trophies + ", " +
                               "N'" + Clubs + "', " +
                               "N'" + Idol + "')";

            // הרצת השאילתה ושמירת השחקן החדש במסד הנתונים
            MyAdoHelper.DoQuery("MyDb.mdf", sqlInsert);

            // הפניה חזרה לדף הבית (כדי שמשתמש רגיל לא ייתקע)
            Response.Redirect("home.aspx");
        }
    }
}