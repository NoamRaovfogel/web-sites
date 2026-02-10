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
        if (Page.IsPostBack)
        {
            string email = Request.Form["gmail"];
            string password = Request.Form["Password"];


            if (email == "NoamRaovfogel@1234gmail.com" && password == "Noam5432")
                Response.Redirect("managment.aspx");
            else
            {
                string sqlSelect =
                "SELECT * FROM tUsers " +
                " WHERE Email = N'" + email + "' and Password = N'" + password + "'";

                bool userExists = MyAdoHelper.IsExist(sqlSelect);

                if (!userExists)
                    stResult = "אימייל או סיסמה שגויים";
                else
                    //stResult = "משתמש רשום";
                    Response.Redirect("home.aspx");
            }
        }
    }
}
