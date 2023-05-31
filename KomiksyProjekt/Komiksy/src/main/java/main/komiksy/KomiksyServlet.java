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

        HttpSession session = request.getSession();

        //REJESTRACJA
        String uname = request.getParameter("uname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        Member member = new Member(uname, password, email, phone, "user");
        session.setAttribute("uzytkownik", member);

        RegisterDao rDao = new RegisterDao();
        String result = rDao.insert(member);
        response.sendRedirect("Logowanie.jsp");
  }

    public void destroy() {
    }
}