package service;

import model.Todo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ServletService {

    private static List<Todo> todos = new ArrayList<>();


    static {
        todos.add(new Todo("Java", LocalDate.of(2022, 10, 25), LocalDate.of(2022, 11, 15), false));
        todos.add(new Todo("Angular", LocalDate.of(2022, 8, 21), LocalDate.of(2022, 9, 15), false));
        todos.add(new Todo("React", LocalDate.of(2022, 5, 8), LocalDate.of(2022, 7, 15), false));
        todos.add(new Todo("Spring boot", LocalDate.of(2022, 2, 1), LocalDate.of(2022, 3, 15), false));
    }

    public void showList(HttpServletRequest request,
                               HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("todos", todos);
        request.getRequestDispatcher("/WEB-INF/views/todo-list.jsp")
                .forward(request, response);
    }

    public void createTodo(HttpServletRequest request,
                           HttpServletResponse response) throws IOException {
        Todo todo = new Todo();
        todo.setName(request.getParameter("name"));

        todo.setCreatedAt(LocalDate.parse(request
                .getParameter("createdAt")));

        todo.setEndAt(LocalDate.parse(request
                .getParameter("endAt")));

        todo.setStatus(false);

        todos.add(todo);

        response.sendRedirect("/todos.do");
    }


    public void retrieveTodo(HttpServletRequest request,
                             HttpServletResponse response) throws ServletException, IOException {
        String todoName = request.getParameter("name");
        Todo todo = new Todo();
        todo.setName(todoName);
        for(Todo t : todos){
            if (t.equals(todo)){
                todo = t;
                break;
            }
        }
        request.setAttribute("todo", todo);
        request.setAttribute("todos", todos);

        request.getRequestDispatcher("/WEB-INF/views/update.jsp")
                .forward(request, response);
    }

    public void updateTodo(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse) throws IOException {
        Todo todo = new Todo();
        todo.setName(httpServletRequest.getParameter("todoName"));
        //Creation du nouveau Todo
        Todo newTodo = new Todo();
        newTodo.setName(httpServletRequest.getParameter("name"));
        newTodo.setCreatedAt(LocalDate.parse(httpServletRequest.getParameter("createdAt")));
        newTodo.setEndAt(LocalDate.parse(httpServletRequest.getParameter("endAt")));
        if (httpServletRequest.getParameter("status") != null) {
            newTodo.setStatus(true);
        } else {
            newTodo.setStatus(false);
        }

        todos.set(todos.indexOf(todo), newTodo);

        httpServletResponse.sendRedirect("/todos.do");
    }

    public void markAsDone(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse) throws IOException {
        Todo todo = new Todo();
        todo.setName(httpServletRequest.getParameter("name"));

        todos.get(todos.indexOf(todo)).setStatus(!todos.get(todos.indexOf(todo)).isStatus());

        httpServletResponse.sendRedirect("/todos.do");
    }

    public void deleteTodo(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse) throws IOException {
        String todoName = httpServletRequest.getParameter("name");
        /*System.out.println(todoName);*/
        Todo todo = new Todo();
        todo.setName(todoName);
        todos.remove(todo);
        httpServletResponse.sendRedirect("/todos.do");
    }
}
