package main.komiksy;

import java.io.*;
import java.lang.reflect.Array;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import main.komiksy.RegisterDao;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet(name = "sugestieBackend", value = "/sugestieBackend")
public class Wyszukiwanie extends HttpServlet {

    String[] lista = { "ALFA ROMEO", "AUDI", "BMW",
            "CHRYSLER", "CITROEN", "DAIHATSU", "FIAT", "FORD", "HONDA", "ISUZU", "JAGUAR", "LADA", "LANCIA", "MAZDA", "MERCEDES", "MITSUBISHI", "NISSAN", "OPEL", "PEUGEOT", "PORSCHE", "RENAULT", "ROVER", "SAAB", "SEAT", "SKODA", "SUBARU", "SUZUKI", "TOYOTA", "VOLVO", "VW" };
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/json");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        Reader wejscie = new InputStreamReader(request.getInputStream());
        // {wartosc": "s"}
        JSONObject json = new JSONObject();
        JSONParser jsonParser = new JSONParser();

        try {
            json = (JSONObject) jsonParser.parse(wejscie);
        }catch (ParseException e) {
            json = new JSONObject();
        }



        String query = (String) json.get("wartosc");
        ArrayList<String> sugestia = new ArrayList<>();
        System.out.println("query = " + query);

        RegisterDao query_ = new RegisterDao();


        try {
            for (String samochod : query_.getRecordsByFirstLetter(query))
            {
                if (samochod.startsWith(query.toUpperCase()) && !query.isEmpty())
                {

                    sugestia.add(samochod);
                }
            }
            json.put("sugestia", sugestia);
        } finally {
            out.println(json.toJSONString());
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Do post");
        doGet(req, resp);
    }

    public void destroy() {
    }
}