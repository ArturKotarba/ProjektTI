<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="main.komiksy.Member" %>
<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="main.komiksy.DatabaseManager" %>

<%
    DatabaseManager Marvel = new DatabaseManager();
    Marvel.getAllDataFromTable("Marvel");
    Map<Integer, Map< String, String > > MarvelTable =  Marvel.getAllDataFromTable("Marvel");
    //System.out.println("DCTable: " + DCTable);

    int index = 1;
    String MarvelTytul;

    if (index < MarvelTable.size())
    {
        MarvelTytul = MarvelTable.get(index).get("Tytuł");
        //System.out.println("MarvelTytul: " + MarvelTytul);
        System.out.println(MarvelTable.get(1).get("Tytuł"));
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
    <title>Marvel</title>
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
    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 1, "Tytuł")%></h3>
    <img src="covery/Avengers. Powrót Gwiezdnego Piętna.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 1, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 1, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 1, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 1, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 2, "Tytuł")%></h3>
    <img src="covery/Amazing Spider-Man. 2099. Tom 7.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 2, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 2, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 2, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 2, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 3, "Tytuł")%></h3>
    <img src="covery/Venom. Tom 3.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 3, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 3, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 3, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 3, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 4, "Tytuł")%></h3>
    <img src="covery/Strażnicy Galaktyki. Bez wiary. Tom 2.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 4, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 4, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 4, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 4, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 5, "Tytuł")%></h3>
    <img src="covery/Uncanny X-Men. Cyclops i Wolverine. Tom 2.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 5, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 5, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 5, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 5, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 6, "Tytuł")%></h3>
    <img src="covery/Ród X, Potęgi X.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 6, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 6, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 6, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 6, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 7, "Tytuł")%></h3>
    <img src="covery/Empireum.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 7, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 7, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 7, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 7, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 8, "Tytuł")%></h3>
    <img src="covery/Spidergedon.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 8, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 8, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 8, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 8, "Opis")%></th></tr>
        </table>
    </div>


    <h3><%=Marvel.getRowFromGivenTable(MarvelTable, 9, "Tytuł")%></h3>
    <img src="covery/Król Thor.png" height="560" width="350">

    <div class="table">
        <table>
            <tr><th style="width: 50px">Scenariusz: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 9, "Scenariusz")%></th></tr>
            <tr><th style="width: 50px">Rysunki: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 9, "Rysunki")%></th></tr>
            <tr><th style="width: 50px">Data wydania: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 9, "Data_wydania")%></th></tr>
            <tr><th style="width: 50px">Opis: </th><th style="width: 500px"><%=Marvel.getRowFromGivenTable(MarvelTable, 9, "Opis")%></th></tr>
        </table>
    </div>


</div>


</body>
</html>


