using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            string Name = Request.Form["Name"];
            string Age = Request.Form["Age"];
            string Trophies = Request.Form["Trophies"];
            string Clubs = Request.Form["Clubs"];
            string Idol = Request.Form["Idol"];



            string sqlinsert =
             "insert into Tbarca (Name , Age , Trophies , Clubs , Idol)" +
             " values (" +
            "N'" + Name + "'," +
            "N'" + Age + "'," +
            "N'" + Trophies + "'," +
            "N'" + Clubs + "'," +
            "N'" + Idol + "'" +
            ")";

            MyAdoHelper.DoQuery("MyDb.mdf", sqlinsert);
            
        }
    }
}