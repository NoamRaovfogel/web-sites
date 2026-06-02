using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managment : System.Web.UI.Page
{
    public string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        // הגנת עמוד ניהול - מי שלא מנהל מועף מיד לדף הבית!
        if (Session["nihol"] != "ok")
        {
            Response.Redirect("home.aspx");
        }

        // ברירת מחדל: שליפת כל המשתמשים מהמסד (כדי שהדף לא יהיה ריק בהתחלה)
        string sqlSelect = "SELECT * FROM tUsers";

        // אם המנהל לחץ על כפתור החיפוש (PostBack) - נסנן את השאילתה
        if (Page.IsPostBack)
        {
            string Name = Request.Form["name"];
            if (Name != null)
            {
                Name = Name.Replace("'", "''");
            }
            string Players = Request.Form["check2"];

            // תיקון: הוספת סוגריים מרובעים [Name] למניעת התנגשות עם מילים שמורות, ודיוק הגרשים
            sqlSelect = "SELECT * FROM tUsers WHERE [Name] LIKE N'%" + Name + "%'";

            if (!string.IsNullOrEmpty(Players))
            {
                sqlSelect += " AND [FootballPlayers] LIKE N'%" + Players + "%'";
            }
        }

        // הרצת השאילתה (תרוץ גם בכניסה לדף וגם בחיפוש!)
        DataTable dt = MyAdoHelper.ExecuteDataTable(sqlSelect);

        if (dt.Rows.Count == 0)
        {
            st = "<h3 style='color:red; text-align:center;'>לא נמצאו משתמשים תואמים לחיפוש</h3>";
        }
        else
        {
            st += "<table border='1' dir='rtl' style='margin: 0 auto; text-align: center; background-color: white; color: black; width: 90%;'>";
            st += "<tr>";
            st += "<th>שם פרטי ושם משפחה</th>";
            st += "<th>אימייל</th>";
            st += "<th>סיסמה</th>"; // חובה להציג כוכביות ולא את הסיסמה האמיתית!
            st += "<th>מספר טלפון</th>";
            st += "<th>שחקני כדורגל</th>";
            st += "<th>מאמן כדורגל</th>";
            st += "<th>עדכונים</th>";
            st += "<th>תקנון</th>";
            st += "<th>גיל</th>";
            st += "</tr>";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st += "<tr>";
                for (int k = 0; k < dt.Columns.Count; k++)
                {
                    st += "<td>";

                    // תיקון מחוון אבטחה: אם הגענו לעמודה של הסיסמה (אינדקס 2 לפי סדר הכותרות שלך), נציג כוכביות!
                    if (k == 2)
                    {
                        st += "******";
                    }
                    else
                    {
                        st += dt.Rows[i][k].ToString();
                    }

                    st += "</td>";
                }
                st += "</tr>";
            }
            st += "</table>";
        }
    }
}