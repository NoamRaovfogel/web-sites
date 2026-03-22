<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
 <h1>הוספת פריט</h1>
     </center>
            <h1 style="text-align:right;">האתר הרשמי של אוהדי ברצלונה</h1>
        <form name="formPage" method="post" runat="server" style="text-align:right;">

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


