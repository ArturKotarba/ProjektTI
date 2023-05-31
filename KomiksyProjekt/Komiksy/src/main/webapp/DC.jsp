<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="main.komiksy.Member" %>
<%@ page import="main.komiksy.DatabaseManager" %>

<%
    DatabaseManager DC = new DatabaseManager();
    DC.getAllDataFromTable("DC");
    Map<Integer, Map< String, String > > DCTable =  DC.getAllDataFromTable("DC");
    //System.out.println("DCTable: " + DCTable);

    int index = 1;
    String DCTytul;

    if (index < DCTable.size())
    {
        DCTytul = DCTable.get(index).get("Tytuł");
        //System.out.println("DCTytul: " + DCTytul);
        System.out.println(DCTable.get(1).get("Tytuł"));
    }
%>

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

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
    <title>DC</title>
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

<div id="wyszukaj">
    <h4>Wpisz nazwę komiksu</h4>
    <div class="box">
    <input id="pole" type="text" onkeyup="pobierzKomiks();">
    </div>

    <div id="wyniki"></div>
</div>

<div id="komiksy">
    <h3><%=DC.getRowFromGivenTable(DCTable, 1, "Tytuł")%></h3>
    <img src="covery/batman-detective.png" height="560" width="350">

    <div class="table">
    <table>
        <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 1, "Scenariusz")%></th></tr>
        <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 1, "Rysunki")%></th></tr>
        <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 1, "Data_wydania")%></th></tr>
        <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 1, "Opis")%></th></tr>
    </table>
    </div>



        <h3><%=DC.getRowFromGivenTable(DCTable, 2, "Tytuł")%></h3>
        <img src="covery/Uniwersum DC - Odrodzenie.jpg" height="560" width="350">

        <div class="table">
            <table>
                <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 2, "Scenariusz")%></th></tr>
                <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 2, "Rysunki")%></th></tr>
                <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 2, "Data_wydania")%></th></tr>
                <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 2, "Opis")%></th></tr>
            </table>
        </div>


    <h3><%=DC.getRowFromGivenTable(DCTable, 3, "Tytuł")%></h3>
    <img src="covery/Uniwersum DC - Lewiatan.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 3, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 3, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 3, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 3, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=DC.getRowFromGivenTable(DCTable, 4, "Tytuł")%></h3>
    <img src="covery/DC Deluxe Authority.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 4, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 4, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 4, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 4, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=DC.getRowFromGivenTable(DCTable, 5, "Tytuł")%></h3>
    <img src="covery/DC Deluxe Authority.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 5, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 5, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 5, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 5, "Opis")%></th></tr>
        </table>
    </div>



    <h3><%=DC.getRowFromGivenTable(DCTable, 6, "Tytuł")%></h3>
    <img src="covery/DC Deluxe Uniwersum DC według Mike'a Mignoli.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 6, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 6, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 6, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 6, "Opis")%></th></tr>
        </table>
    </div>

    <h3><%=DC.getRowFromGivenTable(DCTable, 7, "Tytuł")%></h3>
    <img src="covery/DC Limited Strażnicy.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 7, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 7, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 7, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 7, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=DC.getRowFromGivenTable(DCTable, 8, "Tytuł")%></h3>
    <img src="covery/DC Deluxe Nowa granica.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 8, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 8, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 8, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 8, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=DC.getRowFromGivenTable(DCTable, 9, "Tytuł")%></h3>
    <img src="covery/DC Deluxe Najjaśniejszy dzień.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 9, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 9, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 9, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=DC.getRowFromGivenTable(DCTable, 9, "Opis")%></th></tr>
        </table>
    </div>

</div>


</body>
</html>

