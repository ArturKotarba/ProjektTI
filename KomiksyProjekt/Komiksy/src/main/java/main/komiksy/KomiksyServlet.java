package main.komiksy;

import java.io.*;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class KomiksyServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

  }

    public void destroy() {
    }
}