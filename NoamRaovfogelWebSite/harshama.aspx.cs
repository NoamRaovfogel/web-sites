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
            string Email = Request.Form["email"];
            string Password = Request.Form["Password"];
            string PhoneNumber = Request.Form["phonenumber"];
            string Players = Request.Form["players"];
            string Coach = Request.Form["radio1"];
            string Updates = Request.Form["updates"];
            string Regulations = Request.Form["radio2"];
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
                // תיקון קריסת SQL: הוספת שמות העמודות במפורש (UserName, Email, Password...) 
                // כדי למנוע ניסיון הכנסה לעמודת ה-UserId האוטומטית שמקריסה את הדף
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

                MyAdoHelper.DoQuery("MyDb.mdf", sqlinsert);

                // תיקון מחוון: העברה לדף התחברות (entrance) ולא לדף הבית
                Response.Redirect("entrance.aspx");
            }
        }
    }
}