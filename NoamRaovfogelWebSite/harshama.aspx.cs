using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class harshama : System.Web.UI.Page
{
    public string st = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // תיקון מחוון: חסימת משתמש רשום או מנהל מלהיכנס לדף הרשמה
        if (Session["user"] == "ok" || Session["nihol"] == "ok")
        {
            Response.Redirect("home.aspx");
        }

        if (Page.IsPostBack)
        {
            string Name = Request.Form["name"];
            String Email = Request.Form["email"];
            string Password = Request.Form["Password"];
            string PhoneNumber = Request.Form["phonenumber"];
            string Players = Request.Form["players"];
            string Coach = Request.Form["radio1"];
            string Updates = Request.Form["updates"];
            String Regulations = Request.Form["radio2"];
            string Age = Request.Form["age"];

            if (string.IsNullOrEmpty(Age) || Age == "0")
            {
                Age = "0";
            }

            string sqlSelect =
                "SELECT * FROM tUsers " +
                " WHERE Email = N'" + Email + "'";

            bool userExists = MyAdoHelper.IsExist(sqlSelect);

            if (userExists)
                st = "מייל זה כבר קיים במערכת"; // תיקון מחוון: הודעה ברורה
            else
            {
                string sqlinsert =
                "insert into tUsers" +
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

                MyAdoHelper.DoQuery("MyDb.mdf", sqlinsert);

                // תיקון מחוון: העברה לדף התחברות (entrance) ולא לדף הבית
                Response.Redirect("entrance.aspx");
            }
        }
    }
}