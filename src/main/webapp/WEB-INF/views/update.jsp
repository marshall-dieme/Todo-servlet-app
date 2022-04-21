<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.Todo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SarataTech Servlet</title>
    <link rel="stylesheet" href="webjars/bootstrap/4.6.1/css/bootstrap.min.css">
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
    <style>
        i.bx {
            font-size: 24px;
        }
        i.bx-check-double {
            color: green;
        }
        i.bx-x {
            color: red;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/welcome.do">STS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/welcome.do">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/todos.do">Todos</a>
            </li>
        </ul>
        <span class="navbar-text">
              <a href="/logout.do" class="btn btn-danger text-white">Logout</a>
            </span>
    </div>
</nav>
<br>
<div class="container">
    <%--New Todo form --%>
    <%Todo todo = (Todo) request.getAttribute("todo");%>
    <form action="/todos.do" method="post">
        <div class="row">
            <div class="form-group col">
                <label for="name">Todo</label>
                <input type="text" class="form-control" name="name" id="name" value="<%=todo.getName()%>" />
            </div>
            <div class="form-group col">
                <label for="createdAt">Created At</label>
                <input type="date" class="form-control" name="createdAt" id="createdAt" value="<%=todo.getCreatedAt()%>" />
            </div>
            <div class="form-group col">
                <label for="endAt">End At</label>
                <input type="date" class="form-control" name="endAt" id="endAt" value="<%=todo.getEndAt()%>" />
            </div>
        </div>
        <button class="btn btn-warning" >Update</button>
    </form>

    <% List<Todo> todos = (List<Todo>) request.getAttribute("todos"); %>
    <hr class="my-5"/>
    <div class="table-responsive">
        <table class="table table-hover table-borderless">
            <thead class="thead-dark">
            <tr>
                <th scope="col" class="text-center">Todo</th>
                <th scope="col" class="text-center">Start Date</th>
                <th scope="col" class="text-center">End Date</th>
                <th scope="col" class="text-center">Status</th>
                <th scope="col" class="text-center">Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for(Todo t : todos) { %>
            <tr>
                <td class="text-center"><%= t.getName() %></td>
                <td class="text-center"><%= t.getCreatedAt() %></td>
                <td class="text-center"><%= t.getEndAt() %></td>
                <td class="text-center">
                    <a href="/markasdone.do?name=<%=t.getName()%>">
                        <%= t.isStatus() ? "<i class='bx bx-check-double'></i>" : "<i class='bx bx-x'></i>"  %>
                    </a>
                </td>
                <td class="text-center">
                    <a class="btn btn-warning" href="/update-todo.do?name=<%=t.getName()%>">Update</a>
                    <a class="btn btn-danger" href="/delete-todo.do?name=<%=t.getName()%>">Delete</a>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script src="webjars/popper.js/2.9.3/umd/popper.js"></script>
<script src="webjars/bootstrap/4.6.1/js/bootstrap.min.js"></script>
</body>
</html>

