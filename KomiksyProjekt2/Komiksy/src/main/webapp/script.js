
// Pobieranie kontenera dla zdjęć
var slideshowContainer = document.querySelector(".slideshow-container");

// Pobieranie kontenera dla zdjęć wewnątrz panelu
var slidesContainer = slideshowContainer.querySelector(".slides");

// Ustawianie szerokości kontenera na podstawie liczby zdjęć
slidesContainer.style.width = (100 * slidesContainer.children.length) + "%";

// Ustawianie szerokości każdego zdjęcia na podstawie liczby zdjęć
for (var i = 0; i < slidesContainer.children.length; i++) {
    slidesContainer.children[i].style.width = (100 / slidesContainer.children.length) + "%";
}

// Ustawianie indeksu aktualnego zdjęcia na 0
var currentSlide = 0;

// Funkcja zmieniająca zdjęcie co 5 sekundy
function changeSlide() {

    var _img = document.getElementById('tank');
    _img.style.visibility = 'visible';
    // var newImg = new Image;
    // newImg.onload = function() {
    //     _img.src = this.src;
    // }
    // newImg.src = 'covery/Marvel_spot.png';



    // // Przesuwanie kontenera o szerokość jednego zdjęcia w lewo
    // slidesContainer.style.transform = "translateX(-" + (100 * currentSlide) + "%)";
    //
    // // Zwiększanie indeksu o 1
    // currentSlide = (currentSlide + 1) % slidesContainer.children.length;

    // Uruchamianie funkcji zmieniającej zdjęcie co 5 sekundy
    setTimeout(changeSlide, 500);
}

// Rozpoczęcie zmiany zdjęć po załadowaniu strony
window.onload = changeSlide;

function wyslijAsynchronicznie(url, metoda, typDanych, przeslanyDokument) {

    if (!window.XMLHttpRequest) {
        return null;
    }

    let request = new XMLHttpRequest();
    metoda = metoda || 'GET';
    typDanych = typDanych || 'text/plain';

    request.open(metoda, url);
    request.setRequestHeader('Content-Type', typDanych);

    request.onreadystatechange = function ()
    {
        el = document.getElementById("wyniki");
        el.style.display = 'block';
        el.innerHTML = "laduje dane...";

        if(request.readyState == 4)
        {
            if(request.status == 200)
            {
                let odpowiedzTXT = request.responseText;
                console.log("odpowiedzTXT: " + odpowiedzTXT);
                let odpowiedz = JSON.parse(odpowiedzTXT);
                let rezultat = "";

                for(let wynik of odpowiedz.sugestia)
                {
                    console.log("rezultat= " + rezultat);
                    rezultat += '<div class="lista" style="cursor: pointer;" onclick="wypelnijPoleTekstowe(\''+wynik+'\')">'+wynik+'</div>';
                }
                el.innerHTML = rezultat;
            }
            else
            {
                console.log("Blad o statusie " + request.status);
            }
        }
    }
    request.send(przeslanyDokument);
    return request;

}


function wypelnijPoleTekstowe(value)
{
    document.getElementById("pole").value = value;
    document.getElementById("wyniki").innerHTML = "";
    document.getElementById("wyniki").style.display = "none";
}

function pobierzKomiks(){


    let nazwa_komiksu = document.getElementById("pole");

    if (nazwa_komiksu != null)
    {
        if(nazwa_komiksu.value != "")
        {
            // {wartosc: S}
            let nazwa = {wartosc: document.getElementById("pole").value};
            wyslijAsynchronicznie("sugestieBackend", "POST", "application/json", JSON.stringify(nazwa));
        }
        else
        {
            // Nie wprowadzono wartosci
        }
    }
    else
    {
        // Nie istnieje taki element
    }
}


