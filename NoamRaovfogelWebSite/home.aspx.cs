using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה של דף הבית, היורשת ממחלקת הדפים הכללית של השרת (System.Web.UI.Page)
public partial class home : System.Web.UI.Page
{
    // פעולת אירוע המתרחשת באופן אוטומטי בכל פעם שהמשתמש נכנס או מרענן את דף הבית
    protected void Page_Load(object sender, EventArgs e)
    {
        // כרגע הדף סטטי ומציג מידע קבוע ב-HTML, לכן אין צורך בכתיבת לוגיקה מיוחדת בצד השרת
    }
}