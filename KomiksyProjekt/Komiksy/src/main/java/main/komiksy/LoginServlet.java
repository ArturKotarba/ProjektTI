package main.komiksy;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {



    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {


        response.setContentType("text/html");
        HttpSession session = request.getSession();


        Member kKuzytkownik = (Member) session.getAttribute("uzytkownik");
        if (kKuzytkownik == null)
        {
            System.out.println("null");
            kKuzytkownik = new Member();
            session.setAttribute("uzytkownik", kKuzytkownik);
        }


        kKuzytkownik.setUname(request.getParameter("uname"));

        session.setAttribute("uname", kKuzytkownik.getUname());

        String uname = request.getParameter("uname");
        String password = request.getParameter("password");

        RegisterDao rDao = new RegisterDao();
        boolean result = rDao.validateUser(uname, password);
        String s = rDao.getUserPermission(uname, password);
        //rDao.getUserName(uname, password);


        if (s.equals("user") && result == true) {
            Member uzytkownik = (Member) session.getAttribute("uzytkownik");
            uzytkownik.setUname(uname);
            response.sendRedirect("index.jsp");
        }
        response.getWriter().print(s);
    }


    //        }


//        if (result)
//        {


    public void destroy() {
    }
}