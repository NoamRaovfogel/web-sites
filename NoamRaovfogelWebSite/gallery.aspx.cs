using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה של דף הגלריה, היורשת ממחלקת הדפים הסטנדרטית של השרת
public partial class gallery : System.Web.UI.Page
{
    // פעולת אירוע שמופעלת אוטומטית בכל פעם שדף הגלריה נטען או מתרענן בצד הלקוח
    protected void Page_Load(object sender, EventArgs e)
    {
        // מכיוון שתמונות הגלריה מוצגות באופן קבוע דרך קוד ה-HTML, אין צורך להריץ לוגיקת שרת דינמית כאן
    }
}