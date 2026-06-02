<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowPlayers.aspx.cs" Inherits="ShowPlayers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h1>רשימת השחקנים</h1>
        
        <div style="border: 1px solid white; padding: 10px; width: 50%; margin-bottom: 20px;">
            <h3>חיפוש שחקן חכם</h3>
            <p>הכנס את שם השחקן או חלק מהשם שלו, והמערכת תמצא עבורך את כל השחקנים שמתאימים לחיפוש (חיפוש חלקי - LIKE).</p>
            <form method="post" action="ShowPlayers.aspx">
                <input type="text" name="searchName" placeholder="הכנס שם לחיפוש..." />
                <input type="submit" value="חפש שחקן" />
            </form>
        </div>

        <br />
        <%= st %>
    </center>
</asp:Content>