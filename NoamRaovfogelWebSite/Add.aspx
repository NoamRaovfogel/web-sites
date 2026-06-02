<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript">
        function checkAdd() {
            name = document.getElementById("textarea2").value;
            age = document.getElementById("textarea3").value;
            trophies = document.getElementById("textarea4").value;
            clubs = document.getElementById("textarea5").value;
            idol = document.getElementById("textarea6").value;

            if (name == "") {
                alert("חובה להזין את שם השחקן");
                return false;
            }
            if (age == "") {
                alert("חובה להזין גיל");
                return false;
            }
            if (isNaN(age) == true) {
                alert("גיל חייב להיות מספר");
                return false;
            }
            if (trophies == "") {
                alert("חובה להזין גביעים");
                return false;
            }
            if (isNaN(trophies) == true) {
                alert("גביעים חייב להיות מספר");
                return false;
            }
            // הוספת בדיקה לשני השדות שנשארו כדי לענות על דרישת המחוון "לכל השדות"
            if (clubs == "") {
                alert("חובה להזין קבוצות נוספות");
                return false;
            }
            if (idol == "") {
                alert("חובה להזין שחקן השראה");
                return false;
            }

            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h1>הוספת פריט</h1>
    </center>
    <h1 style="text-align:right;">האתר הרשמי של אוהדי ברצלונה</h1>
    
    <form name="formPage" method="post" runat="server" style="text-align:right;" onsubmit="return checkAdd();">

        שם מלא של השחקן: 
        <textarea rows="1" cols="20" name="Name" id="textarea2" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        גילו של השחקן: 
        <textarea rows="1" cols="20" name="Age" id="textarea3" placeholder="הכנס מלל חופשי"></textarea>                
        <br />
        גביעים שהשחקן זכה בהם:
        <textarea rows="1" cols="20" name="Trophies" id="textarea4" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        קבוצות שהשחקן שיחק בהם חוץ מברצלונה: 
        <textarea rows="1" cols="20" name="Clubs" id="textarea5" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        השחקן שנתן לו השראה: 
        <textarea rows="1" cols="20" name="Idol" id="textarea6" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        <br />
        <input id="Submit1" type="submit" value="שלח" />
    </form>    
</asp:Content>