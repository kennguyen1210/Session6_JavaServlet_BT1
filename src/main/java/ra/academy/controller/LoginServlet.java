package ra.academy.controller;

import ra.academy.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private List<User> list;
    @Override
    public void init(ServletConfig config) throws ServletException {
        list = Arrays.asList(
                new User(1,"Kennguyen","123456"),
                new User(2,"Nam123","123123"),
                new User(3,"Phuong123","121212")
        );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/form.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action!= null){
            switch (action){
                case "LOGIN":
                    String user = request.getParameter("user");
                    String password = request.getParameter("password");
                    Optional<User> loginUser = list.stream().filter(u->u.getUser().equals(user)&&u.getPassword().equals(password)).findFirst();
                        if (loginUser.isPresent()){
                            request.setAttribute("message",loginUser.get());
                            request.getRequestDispatcher("/index.jsp").forward(request,response);
                        } else {
                            request.setAttribute("user",user);
                            request.setAttribute("password",password);
                            request.setAttribute("error","User hoac password chua dung!");
                            request.getRequestDispatcher("/form.jsp").forward(request,response);
                        }
                    break;
            }
        }


    }
}