package ra.academy.controller;

import ra.academy.model.Todo;
import ra.academy.service.TodoService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "TodoServlet", value = "/TodoServlet")
public class TodoServlet extends HttpServlet {
    private TodoService todoService;

    @Override
    public void init() throws ServletException {
        todoService = new TodoService();
        Todo t1 = new Todo(todoService.getNewId(), "Đi học", true);
        Todo t2 = new Todo(todoService.getNewId(), "Đi ngủ", false);
        todoService.save(t1);
        todoService.save(t2);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "GETALL":
                    showListTodo(response, request);
                    break;
                case "DELETE":
                    int id = Integer.parseInt(request.getParameter("id"));
                    todoService.deleteById(id);
                    showListTodo(response , request);
                    break;
                case "ADD":
                    addTodo(response, request);
                    break;
                case "EDIT":
                    editTodo(response, request);
                    break;



            }
        }
    }

    protected void showListTodo(HttpServletResponse response , HttpServletRequest request) throws IOException, ServletException {
        // lấy danh sách công việc
        List<Todo> list = todoService.findAll();
        request.setAttribute("todoList",list);
        request.getRequestDispatcher("/view/viewList.jsp").forward(request,response);

    }
    protected void addTodo(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
        request.getRequestDispatcher("/view/addTodo.jsp").forward(request,response);
    }
    protected void editTodo(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Todo editTodo = todoService.findById(id);
        if(editTodo!= null){
            request.setAttribute("editTodo",editTodo);
            request.getRequestDispatcher("/view/editPage.jsp").forward(request,response);
        }
    }
    protected void edit(HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "ADD":
                    String task = request.getParameter("task");
                    boolean status = Boolean.parseBoolean(request.getParameter("status"));
                    Todo newTodo= new Todo(todoService.getNewId(),task,status);
                    todoService.save(newTodo);
                    showListTodo(response, request);
                    break;
                case "EDIT":
                    String editTask = request.getParameter("task");
                    boolean editStatus = Boolean.parseBoolean(request.getParameter("status"));
                    int id = Integer.parseInt(request.getParameter("id"));
                    Todo editTodo= new Todo(id,editTask,editStatus);
                    todoService.save(editTodo);
                    showListTodo(response, request);
                    break;
            }
        }
    }
}