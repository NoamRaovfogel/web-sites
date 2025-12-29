<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cnisa.aspx.cs" Inherits="cnisa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
        <h1 style="text-align:right;">טופס על כדורגל</h1>
    <form name="formPage" method="post" runat="server" style="text-align:right;">
        שם פרטי: <input type="text" name="firstname" id="firstname" placeholder="example">
        <br />
        שחקני כדורגל אהובים: 
        <br />
        מסי<input type="checkbox" name="check2" checked value="מסי" id="check_1"><br />
        ניימאר: <input type="checkbox" name="check2" value="ניימאר" id="check_2"><br />
       ראפיניה<input type="checkbox" name="check2" value="רונאלדו"  id="check_3"><br />
        פדרי: <input type="checkbox" name="check2" value="פדרי" id="check_4">
         <br />
       מאמן כדורגל אהוב: 
        <br />
       האנסי פליק<input type="radio" name="radio1" checked value="כלב" id="radio_1"><br />
        צ'אבי אלונסו<input type="radio" name="radio1" value="חתול" id="radio_2"><br />
       צ'אבי הרננדז<input type="radio" name="radio1" value="סוס"  id="radio_3"><br />
        לואיס אנריקה<input type="radio" name="radio1" value="ארנב" id="radio_4"><br />
        תשובה פתוחה:
        <textarea rows="5" cols="20" name="textarea1" id="textarea1" placeholder="הכנס מלל חופשי"></textarea>
        <br />
        <select name="age" id="age">
            <option value="0">בחר גיל</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
        </select>
        <br />
        <input id="Submit1" type="submit" value="שלח" />
    </form>
</asp:Content>

