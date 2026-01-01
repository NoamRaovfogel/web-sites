using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class entrance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    
    protected void gmail_TextChanged(object sender, EventArgs e)
    {
        if (gmail.Text != "")
        {
            password.Enabled = true;
            password.Focus();
        }
    }

    
    protected void password_TextChanged(object sender, EventArgs e)
    {
        if (password.Text != "")
        {
            msg.Text = "you successfully logged in";
        }
    }
}