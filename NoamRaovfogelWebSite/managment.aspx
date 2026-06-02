  <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managment.aspx.cs" Inherits="managment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
        <h1>פאנל הנהלה</h1>
        <h2>האתר הרשמי של אוהדי ברצלונה</h2>
    </center>

    <br />

    <form name="formPage" method="post" runat="server" dir="rtl" style="margin-right: 10%;">
        
        <b>חיפוש לפי שם:</b> 
        <input type="text" name="name" id="name" placeholder="הכנס שם לחיפוש..." /> 
        <br /><br />
        
        <b>סינון לפי שחקן אהוב:</b>
        <br />
        <input type="checkbox" name="check2" checked="checked" value="מסי" id="check_1" /> מסי<br />
        <input type="checkbox" name="check2" value="ניימאר" id="check_2" /> ניימאר<br />
        <input type="checkbox" name="check2" value="ראפיניה" id="check_3" /> ראפיניה<br />
        <input type="checkbox" name="check2" value="פדרי" id="check_4" /> פדרי<br />
        
        <br />
        <input id="Submit1" type="submit" value="חפש משתמשים" style="padding: 5px 15px; cursor: pointer;" />
    </form>

    <center>
        <br /><br />
        <%=st %>
        <br />
    </center>

</asp:Content>