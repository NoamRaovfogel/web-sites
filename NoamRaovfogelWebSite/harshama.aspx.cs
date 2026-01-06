using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class harshama : System.Web.UI.Page
{
    public string שם;
    public string אימייל;
    public string  טלפון ;
    public string שחקן;
    public string מאמן;
    public string עדכונים;
    public string תקנון;
    public string גיל;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
           שם = "שם:" + Request.Form["name"];
            אימייל = "אימייל:" + Request.Form["gmail"];
            טלפון = "טלפון:" + Request.Form["phonenumber"];
           שחקן = " שחקן:" +Request.Form["check2"];
            מאמן = " מאמן:" + Request.Form["radio1"];
            עדכונים = " עדכונים:" + Request.Form["radio3"];
           תקנון = " תקנון:" + Request.Form["radio2"];
           גיל = " גיל:" + Request.Form["age"];

        }
    }
}