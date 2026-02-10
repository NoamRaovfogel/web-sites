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
        if (Page.IsPostBack)
        {
           string Name = Request.Form["name"];
            String Email =  Request.Form["gmail"];
            string Password = Request.Form["Password"];
            string PhoneNumber  = Request.Form["phonenumber"];
           string Players = Request.Form["check2"];
            string Coach =  Request.Form["radio1"];
            string Updates =  Request.Form["radio3"];
          String Regulations = Request.Form["radio2"];
           string Age =  Request.Form["age"];



            string sqlSelect =
                "SELECT * FROM tUsers " +
                " WHERE Email = N'" + Email + "'";

            bool userExists = MyAdoHelper.IsExist(sqlSelect);

            if (userExists)
                st = "משתמש קיים";
            else {



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
                //st = "נרשמת בהצלחה!";
                Response.Redirect("home.aspx");
            }
        }
    }
}