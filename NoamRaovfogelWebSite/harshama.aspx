<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="harshama.aspx.cs" Inherits="harshama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript">

    function checkAll() {
        nameErr2.innerHTML = "";
        emailErr2.innerHTML = "";
        PasswordErr2.innerHTML = "";
        PhoneNumberErr2.innerHTML = "";
        AgeErr2.innerHTML = "";
        FavoritesErr2.innerHTML = "";
        CoachErr2.innerHTML = "";
        TermsErr2.innerHTML = "";

        result = true;

        if (CheckFirstName() == false)
            result = false;

        if (CheckEmail() == false)
            result = false;

        if (CheckPassword() == false)
            result = false;

        if (CheckPhoneNumber() == false)
            result = false;

        if (CheckAge() == false)
            result = false;

        if (CheckFavorites() == false)
            result = false;

        if (CheckCoach() == false)
            result = false;

        if (CheckTerms() == false)
            result = false;

        return result;
    }

    function CheckFirstName() {
        name = document.getElementById("name").value;
        if (name.length < 2) {
            nameErr2.innerHTML = "שם חייב להכיל לפחות שני תווים";
            return false;
        }
        if (name.length > 10) {
            nameErr2.innerHTML = "שם ארוך מדי";
            return false;
        }
        return true;
    }

    function CheckEmail() {
        email = document.getElementById("email").value;

        if (email.length < 8) {
            emailErr2.innerHTML = "אימייל קצר מדי";
            return false;
        }
        if (email.length > 25) {
            emailErr2.innerHTML = "אימייל ארוך מדי";
            return false;
        }
        if (email.includes("@") == false) {
            emailErr2.innerHTML = "חייב לכלול @ באימייל";
            return false;
        }
        return true;
    }

    function CheckPassword() {
        Password = document.getElementById("Password").value;

        if (Password.length < 8) {
            PasswordErr2.innerHTML = "סיסמה קצרה מדי";
            return false;
        }
        if (Password.length > 12) {
            PasswordErr2.innerHTML = "סיסמה ארוכה מדי";
            return false;
        }
        return true;
    }

    function CheckPhoneNumber() {
        phoneNumber = document.getElementById("phonenumber").value;

        if (phoneNumber.length < 10) {
            PhoneNumberErr2.innerHTML = "מספר טלפון קצר מדי";
            return false;
        }
        if (phoneNumber.length > 10) {
            PhoneNumberErr2.innerHTML = "מספר טלפון ארוך מדי";
            return false;
        }
        return true;
    }

    function CheckAge() {
        age = document.getElementById("age").value;

        if (age == "0") {
            AgeErr2.innerHTML = "יש לבחור גיל";
            return false;
        }
        return true;
    }

    function CheckFavorites() {
        c1 = document.getElementById("check_1").checked;
        c2 = document.getElementById("check_2").checked;
        c3 = document.getElementById("check_3").checked;
        c4 = document.getElementById("check_4").checked;

        if (!c1 && !c2 && !c3 && !c4) {
            FavoritesErr2.innerHTML = "יש לבחור שחקן";
            return false;
        }
        return true;
    }

    function CheckCoach() {
        r1 = document.getElementById("radio_1").checked;
        r2 = document.getElementById("radio_2").checked;
        r3 = document.getElementById("radio_3").checked;
        r4 = document.getElementById("radio_4").checked;

        if (!r1 && !r2 && !r3 && !r4) {
            CoachErr2.innerHTML = "יש לבחור מאמן";
            return false;
        }
        return true;
    }

    function CheckTerms() {
        yes = document.getElementById("radio_7").checked;

        if (!yes) {
            TermsErr2.innerHTML = "חובה לאשר תקנון";
            return false;
        }
        return true;
    }

</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center>
    <h1>הרשמה</h1>
    <h3 style="color:red;"><%=st %></h3> 
</center>

<h1 style="text-align:right;">האתר הרשמי של אוהדי ברצלונה</h1>

<form name="formPage" method="post" runat="server" style="text-align:right;" onsubmit="return checkAll();">

:שם פרטי ושם משפחה  
<input type="text" id="name" name="name">
<span id="nameErr2" style="color:red;"></span>
<br />

:אימייל  
<input type="text" id="email" name="email">
<span id="emailErr2" style="color:red;"></span>
<br />

:סיסמה  
<input type="password" id="Password" name="Password">
<span id="PasswordErr2" style="color:red;"></span>
<br />

:מספר טלפון  
<input type="text" id="phonenumber" name="phonenumber">
<span id="PhoneNumberErr2" style="color:red;"></span>
<br /><br />

שחקני כדורגל אהובים:<br />
מסי <input type="checkbox" name="players" value="מסי" id="check_1"><br />
ניימאר <input type="checkbox" name="players" value="ניימאר" id="check_2"><br />
ראפיניה <input type="checkbox" name="players" value="ראפיניה" id="check_3"><br />
פדרי <input type="checkbox" name="players" value="פדרי" id="check_4"><br />
<span id="FavoritesErr2" style="color:red;"></span>

<br /><br />

מאמן כדורגל אהוב:<br />
האנסי פליק <input type="radio" name="radio1" value="האנסי פליק" id="radio_1"><br />
רונלד קואמן <input type="radio" name="radio1" value="רונלד קואמן" id="radio_2"><br />
צ'אבי הרננדז <input type="radio" name="radio1" value="צ'אבי הרננדז" id="radio_3"><br />
לואיס אנריקה <input type="radio" name="radio1" value="לואיס אנריקה" id="radio_4"><br />
<span id="CoachErr2" style="color:red;"></span>

<br /><br />

האם אתה מאשר את התקנון:<br />
כן <input type="radio" name="radio2" value="כן" id="radio_7"><br />
לא <input type="radio" name="radio2" value="לא" id="radio_8"><br />
<span id="TermsErr2" style="color:red;"></span>

<br /><br />

<select id="age" name="age">
    <option value="0">בחר גיל</option>
    <option value="14">14</option>
    <option value="15">15</option>
    <option value="16">16</option>
</select>
<span id="AgeErr2" style="color:red;"></span>

<br /><br />

<textarea id="textarea1" name="updates"></textarea>

<br /><br />

<input type="submit" value="שלח">

</form>

</asp:Content>