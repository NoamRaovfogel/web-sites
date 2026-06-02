using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class entrance : System.Web.UI.Page
{
    public string stResult = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        // חובה במחוון: מניעת כניסה מדף אורח למשתמש רשום או מנהל
        if (Session["user"] == "ok" || Session["nihol"] == "ok")
        {
            Response.Redirect("home.aspx");
        }

        if (Page.IsPostBack)
        {
            string email = Request.Form["gmail"];
            string password = Request.Form["Password"];


            if (email == "NoamRaovfogel@1234gmail.com" && password == "Noam5432")
            {
                Session["nihol"] = "ok";
                Session["name"] = "היי נועם המנהל";

                Response.Redirect("managment.aspx");
            }
            else
            {
                string sqlSelect =
                "SELECT * FROM tUsers " +
                " WHERE Email = N'" + email + "' and Password = N'" + password + "'";

                System.Data.DataTable dt = MyAdoHelper.ExecuteDataTable(sqlSelect);

                if (dt.Rows.Count == 0)
                {
                    // חובה במחוון: הודעת שגיאה בהתחברות
                    stResult = "אימייל או סיסמה שגויים, נסה שנית";
                    Session["name"] = "היי אורח";
                }
                else
                {
                    Session["user"] = "ok";
                    Session["name"] = dt.Rows[0]["Name"];

                    Response.Redirect("home.aspx");
                }

            }
        }
    }
}