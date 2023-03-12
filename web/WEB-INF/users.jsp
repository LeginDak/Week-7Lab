<%-- 
    Document   : users
    Created on : Mar 7, 2023, 10:22:03 AM
    Author     : Legin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <h1>Add User</h1>
        <form action="user" method="POST">
            <input type="hidden" name="action" value="add">
            <div>
                <input type="email" name="email" id="email">
            </div>
            <div>
                <input type="text" name="firstName" id="firstName">
            </div>
            <div>
                <input type="text" name="lastName" id="lastName">
            </div>
            <input type="password" name="password" id="password">
            </div>
            
            <select name="role" id="role">
                <option>Choose your role</option>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.roleName}">${role.roleName}</option>
                </c:forEach>
            </select>
            
            <button type="submit">Add user</button>
        </form>
        
        <h1>User Management System</h1>
        <form action="user" method="POST">
            <table>
                <thead>
                    <tr>
                        <th>E-mail</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Role</th>
                        <th>Active</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
            </thead>
            
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.role.roleName}</td>
                        <td>${user.active ? "Y" : "N"}</td>
                        <td><button type="submit" name="action" value="edit?${user.email}"></button></td>
                        <td><button type="submit" name="action" value="delete?${user.emai}"></button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            </table>
        </form>
        
        <h1>Edit User</h1>
        <form action="user" method="POST">
            <input type="hidden" name="action" value="edit">
            <div>
                <input type="email" name="email" id="email" readonly value="${user.email}">
            </div>
            <div>
                <input type="text" name="firstName" id="firstName" value="${user.firstName}">
            </div>
            <div>
                <input type="text" name="lastName" id="lastName" value="${user.lastName}">
            </div>
            <div>
                <input type="password" name="paassword" id="ppassword" value="${user.password}">
            </div>
            
            <select name="role" id="role">
                <option>Choose Your Role</option>
                <c:forEach var="role" items="${roles}">
                    <option value="${role.roleName}">${role.roleName}</option>
                </c:forEach>
            </select>
            
            <button type="submit">Save</button>
            <button type="submit">Cancel</button>
        </form>
    </body>
</html>
