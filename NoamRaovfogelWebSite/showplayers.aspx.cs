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

        // חובה במחוון: שליפת נתונים מהטבלה הנוספת והצגתם
        string sql = "SELECT * FROM Tbarca";
        DataTable dt = MyAdoHelper.ExecuteDataTable(sql);

        if (dt.Rows.Count > 0)
        {
            // בניית טבלת HTML פשוטה עם הנתונים שלך
            st += "<table border='1' dir='rtl' style='margin: 0 auto; text-align: center; background-color: white; color: black; width: 80%;'>";
            st += "<tr><th>שם השחקן</th><th>גיל</th><th>גביעים</th><th>קבוצות עבר</th><th>השראה</th></tr>";

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                st += "<tr>";
                st += "<td>" + dt.Rows[i]["Name"].ToString() + "</td>";
                st += "<td>" + dt.Rows[i]["Age"].ToString() + "</td>";
                st += "<td>" + dt.Rows[i]["Trophies"].ToString() + "</td>";
                st += "<td>" + dt.Rows[i]["Clubs"].ToString() + "</td>";
                st += "<td>" + dt.Rows[i]["Idol"].ToString() + "</td>";
                st += "</tr>";
            }
            st += "</table>";
        }
        else
        {
            st = "אין עדיין שחקנים במסד הנתונים.";
        }
    }
}