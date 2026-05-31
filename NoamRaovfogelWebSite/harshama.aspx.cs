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
            String Email = Request.Form["email"]; // שונה מ-gmail ל-email כדי להתאים לטופס
            string Password = Request.Form["Password"];
            string PhoneNumber = Request.Form["phonenumber"];
            string Players = Request.Form["players"]; // שונה מ-check2 ל-players כדי לקלוט את השחקנים שנבחרו
            string Coach = Request.Form["radio1"];
            string Updates = Request.Form["updates"]; // שונה מ-radio3 ל-updates כדי לקלוט את ה-textarea
            String Regulations = Request.Form["radio2"];
            string Age = Request.Form["age"];

            // הגנה קריטית: אם הגיל מגיע ריק, נשים בו "0" כדי שמשפט ה-SQL לא יישבר ויזרוק שגיאה
            if (string.IsNullOrEmpty(Age) || Age == "0")
            {
                Age = "0";
            }


            string sqlSelect =
                "SELECT * FROM tUsers " +
                " WHERE Email = N'" + Email + "'";

            bool userExists = MyAdoHelper.IsExist(sqlSelect);

            if (userExists)
                st = "משתמש קיים";
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
                //st = "נרשמת בהצלחה!";
                Response.Redirect("home.aspx");
            }
        }
    }
}