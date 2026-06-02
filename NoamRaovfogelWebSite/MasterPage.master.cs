using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה הpartial של דף האב היורשת ממחלקת המאסטר הרשמית של ה-NET.
public partial class MasterPage : System.Web.UI.MasterPage
{
    // פעולה מוגנת המתחילה לעבוד באופן אוטומטי מיד ברגע שהדף נטען בשרת (אירוע טעינת הדף)
    protected void Page_Load(object sender, EventArgs e)
    {
        // כרגע הפעולה ריקה מאחר וכל הלוגיקה והבדיקות של ה-Session מבוצעות ישירות בדף ה-HTML (ה-markup)
    }
}