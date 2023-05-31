<%@ page import="main.komiksy.Member" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    Member kKuzytkownik = (Member) session.getAttribute("uzytkownik");
    if (kKuzytkownik == null)
    {
        kKuzytkownik = new Member();
        session.setAttribute("uzytkownik", kKuzytkownik);
    }
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Internetowa księgarnia z komiksami największych amerykańskich wydawnictw: DC i Marvel!">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
    <title>Sklep SUPERczesiu - Homepage</title>
   <link rel="stylesheet" type="text/css" href="style.css"/>
    <link rel="stylesheet" type="text/css" href="style2.css"/>

    <script src="script.js" defer></script>

</head>
<body onload="changeImage(); setInterval(changeImage, 5000);">
<div id="kontener">
    <div id="naglowek">
        <a href="index.jsp" title="Strona główna" class="link-logo link-logo-img left">
            <img src="covery/logo.png" width="251" height="44" >
        </a>
    </div>

    <div class="log">
        <% if(kKuzytkownik.getPermission() == "user" || kKuzytkownik.getPermission() == "admin" ) { %>
        <p>Jesteś zalogowany jako <b><%=kKuzytkownik.getUname()%></b></p>
        <form action="logout" method="post">
            <input type="submit" value="Wyloguj"></br>
        </form>
        <% } else { %>
        <% } %>
    </div>




    <div class="srodek">
        <nav>
            <input type="checkbox" id="menu" name="menu" class="m-menu__checkbox">
            <label class="m-menu__toggle" for="menu">
                <svg width="35" height="35" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="butt" stroke-linejoin="arcs"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
            </label>
            <label class="m-menu__overlay" for="menu"></label>

            <div class="m-menu">
                <div class="m-menu__header">
                    <label class="m-menu__toggle" for="menu">
                        <svg width="35" height="35" viewBox="0 0 24 24" fill="none" stroke="#000000" stroke-width="2" stroke-linecap="butt" stroke-linejoin="arcs">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </label>
                    <span>MENU</span>
                </div>
                <ul>

                    <li><a href="DC.jsp">DC</a></li>
                    <li><a href="Marvel.jsp">Marvel</a></li>
                    <li><a href="Logowanie.jsp">Logowanie</a></li>
                    <li><a href="Rejestracja.jsp">Rejestracja</a></li>
                    <% if(kKuzytkownik.getPermission() == "admin") { %>
                    <li><a href="Zarządzanie.jsp">Zarządzanie</a></li>
                    <% } else { %>
                    <% } %>
                </ul>
            </div>
        </nav>
    </div>
    <div class="slideshow-container">
        <div class="slides">
            <img class="slider-image" src="covery/DC_spot.png" height="357" width="1041" alt="Zdjęcie 1">
            <img class="slider-image" src="covery/Marvel_spot.png" height="317" width="982" alt="Zdjęcie 2">
            <img class="slider-image" src="covery/comics.png" height="357" width="883" alt="Zdjęcie 3">
        </div>
    </div>
</div>



</body>
</html>

