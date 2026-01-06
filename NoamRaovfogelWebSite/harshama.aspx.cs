using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class harshama : System.Web.UI.Page
{
    public string name;
    public string gmail;
    public string phonenumber;
    public string footballplayers;
    public string footballcoach;
    public string updates;
    public string regulations;
    public string age;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            name = "name:" + Request.Form["name"];
            gmail = "gmail:" + Request.Form["gmail"];
            phonenumber = "phonenumber:" + Request.Form["phonenumber"];
            footballplayers = " footballplayers:" +Request.Form["check2"];
            footballcoach = " footballcoach:" + Request.Form["radio1"];
            updates = " updates:" + Request.Form["radio3"];
            regulations = " regulations:" + Request.Form["radio2"];
            age = " age:" + Request.Form["age"];

        }
    }
}