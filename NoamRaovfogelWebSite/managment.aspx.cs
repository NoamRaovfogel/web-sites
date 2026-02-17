using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class managment : System.Web.UI.Page
{
    public string st = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string Name = Request.Form["name"];
            string Players = Request.Form["check2"];
           

            string sqlSelect =
                "SELECT * FROM tUsers " +
                " WHERE Name = N'" + Name + "'" +
                " AND FootballPlayers = N'" + Players + "'";

            DataTable dt = MyAdoHelper.ExecuteDataTable(sqlSelect);

            if (dt.Rows.Count == 0)
            {
                st = "אין נתונים";
            }
            else
            {
                st += "<table border = '1'>";
                st += "<tr>";
                st += "<th> שם פרטי ושם משפחה</th>";
                st += "<th>אימייל</th>";
                st += "<th>סיסמה</th>";
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
                        st += dt.Rows[i][k];
                        st += "</td>";
                    }
                    st += "</tr>";
                }
                st += "</table>";
            }
        }
    }
}