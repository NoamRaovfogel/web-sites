using System;
using System.Data;

public partial class ShowPlayers : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // חובה במחוון: אבטחת עמודים - חסימת אורחים. מותר רק למשתמש רשום או מנהל
        if (Session["nihol"] != "ok" && Session["user"] != "ok")
        {
            Response.Redirect("home.aspx");
        }

        // שליפת נתונים - ברירת מחדל מציג הכל
        string sql = "SELECT * FROM Tbarca";

        // חובה במחוון: ביצוע החיפוש (בחרנו בחיפוש LIKE לפי שם)
        if (Request.Form["searchName"] != null && Request.Form["searchName"] != "")
        {
            string search = Request.Form["searchName"];
            // נניח שהעמודה של השם במסד הנתונים נקראת Name. אם היא נקראת אחרת (למשל PlayerName), צריך לשנות פה
            sql = "SELECT * FROM Tbarca WHERE Name LIKE '%" + search + "%'";
        }

        DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

        if (dt.Rows.Count > 0)
        {
            // בניית טבלת HTML פשוטה עם הנתונים
            st += "<table border='1' dir='rtl' style='margin: 0 auto; text-align: center; background-color: white; color: black; width: 80%;'>";
            st += "<tr><th>שם השחקן</th><th>גיל</th><th>גביעים</th><th>קבוצות עבר</th><th>השראה</th></tr>";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st += "<tr>";

                // שים לב למספרים בתוך ה-[ ] בסוף כל שורה:
                st += "<td>" + dt.Rows[i][1].ToString() + "</td>"; // כאן צריך להיות השם! 
                st += "<td>" + dt.Rows[i][2].ToString() + "</td>"; // כאן צריך להיות הגיל! 
                st += "<td>" + dt.Rows[i][3].ToString() + "</td>"; // כאן צריכים להיות הגביעים!
                st += "<td>" + dt.Rows[i][4].ToString() + "</td>"; // כאן צריכות להיות קבוצות העבר!
                st += "<td>" + dt.Rows[i][5].ToString() + "</td>"; // כאן צריכה להיות ההשראה!

                st += "</tr>";
            }
            st += "</table>";
        }
        else
        {
            st = "לא נמצאו שחקנים התואמים לחיפוש שלך.";
        }
    }
}