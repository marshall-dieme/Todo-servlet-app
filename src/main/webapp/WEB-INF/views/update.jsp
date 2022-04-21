<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.Todo" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>SarataTech Servlet</title>
    </head>
    <body>
        <h1>Welcome ${username}</h1>
        <a href="/logout.do">Log out ?</a>

        <% Todo todo1 = (Todo) request.getAttribute("todo"); %>
        <%--New Todo form --%>
        <form action="/update-todo.do" method="post">
            <div>
                <label for="name">Todo</label>
                <input type="text" name="name" id="name" value="<%= todo1.getName() %>" />
                <input type="text" name="todoName" id="todoName" hidden value="<%= todo1.getName() %>" />
            </div>
            <div>
                <label for="createdAt">Created At</label>
                <input type="date" name="createdAt" id="createdAt" value="<%= todo1.getCreatedAt() %>" />
            </div>
            <div>
                <label for="endAt">End At</label>
                <input type="date" name="endAt" id="endAt" value="<%= todo1.getEndAt() %>" />
            </div>
            <div>
                <label for="status">Status : </label>
                <input type="checkbox" name="status" id="status" <%= todo1.isStatus() ? "checked" : "" %>>
            </div>
            <input type="submit" value="Update">
        </form>

        <% List<Todo> todos = (List<Todo>) request.getAttribute("todos"); %>


        <table>
            <thead>
            <tr>
                <th>Todo</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for(Todo todo : todos) { %>
            <tr>
                <td><%= todo.getName() %></td>
                <td><%= todo.getCreatedAt() %></td>
                <td><%= todo.getEndAt() %></td>
                <td><%= todo.isStatus() %></td>
                <td>
                    <a href="/delete-todo.do?name=<%=todo.getName()%>">Delete</a>
                    <a href="/update-todo.do?name=<%=todo.getName()%>">Update</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </body>
</html>

