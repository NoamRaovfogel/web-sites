// ייבוא מרחבי שמות (Namespaces) סטנדרטיים של מערכת ההפעלה ורכיבי ה-NET.
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// הגדרת המחלקה החלקית (partial class) של דף המידע, היורשת ממחלקת הדפים הרשמית של השרת (System.Web.UI.Page)
// המילה partial אומרת שהמחלקה הזו מתחברת בזמן הריצה יחד עם קוד ה-HTML שבקובץ info.aspx
public partial class info : System.Web.UI.Page
{
    // פעולת אירוע (Event Handler) המופעלת אוטומטית בצד השרת בכל פעם שהדף נטען או מתרענן
    // sender: האובייקט שגרם להפעלת האירוע (במקרה הזה, הדף עצמו)
    // e: פרמטרים ונתונים נוספים שנשלחו יחד עם האירוע
    protected void Page_Load(object sender, EventArgs e)
    {
        // בדף זה התוכן הוא קבוע (סטטי) ואין צורך בעיבוד נתונים דינמי או שליפה ממסד הנתונים.
        // לכן הפעולה נשארת ריקה, אך היא חיונית כדי לשמור על תקינות מחזור החיים של הדף (Page Life Cycle) ב-ASP.NET.
    }
}