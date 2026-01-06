using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AspNet : System.Web.UI.Page
{
    public string strkefel;
    protected void Page_Load(object sender, EventArgs e)
    {
      
        strkefel = "<table border = '1' width =80%>";
   
        for (int i = 1; i <= 10; i++)
        {
            strkefel += "<tr style=\"background-color: green\">";
            for (int j = 1; j <= 10; j++)
            {
                strkefel += "<td>";
                strkefel += i * j;
                strkefel += "</td>";
            }
            strkefel += "</tr>";
        }
        strkefel += "</table>";
    }
   
}
 