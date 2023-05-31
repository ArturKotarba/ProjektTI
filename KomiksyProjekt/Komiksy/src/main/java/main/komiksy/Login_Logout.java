package main.komiksy;

import java.io.*;
import java.util.ArrayList;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "login", urlPatterns = {"/login", "/logout"} )
public class Login_Logout extends HttpServlet {

    enum userDataOrder
    {
        uname,
        password,
        email,
        phone,
        permission,
        none
    };


    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html");
        HttpSession session = request.getSession();


        // logout
        if (request.getRequestURL().toString().contains("logout"))
        {
            session.removeAttribute("uzytkownik");
            response.sendRedirect("index.jsp");
        }

        // login
        String uname = request.getParameter("uname");
        String password = request.getParameter("password");

        DatabaseManager rDao = new DatabaseManager();
        ArrayList<String> userData = new ArrayList<>();

        if (rDao.validateUserAndFillData(uname, password, userData))
        {
            System.out.println("one");
            Member firstLoginUser = (Member) session.getAttribute("uzytkownik");
            System.out.println("two");
            firstLoginUser = new Member();

            firstLoginUser.setUname(userData.get( userDataOrder.uname.ordinal() ));
            firstLoginUser.setPassword(userData.get( userDataOrder.password.ordinal() ));
            firstLoginUser.setPhone(userData.get( userDataOrder.phone.ordinal() ));
            firstLoginUser.setEmail(userData.get( userDataOrder.email.ordinal() ));
            firstLoginUser.setPermission(userData.get( userDataOrder.permission.ordinal() ));

            session.setAttribute("uzytkownik", firstLoginUser);
            response.sendRedirect("index.jsp");

        }
    }

    public void destroy() {
    }
}