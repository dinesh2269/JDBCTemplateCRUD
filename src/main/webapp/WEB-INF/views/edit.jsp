<%@ page language="java" import="com.model.Employee" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>
    <link rel="stylesheet" href="styles.css">
    <style>
    	body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
}

.form-container {
    max-width: 500px;
    margin: 50px auto;
    padding: 20px;
    padding-right: 40px; 
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="date"],
input[type="number"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

button:hover {
    background-color: #45a049;
}
    	
    </style>
</head>
<body>
<%Employee emp=(Employee)request.getAttribute("employee"); %>
    <div class="form-container">
        <h2>Add Employee</h2>
        <form action="update_employee" method="POST">
            <div class="form-group">
                <label for="first_name">First Name:</label>
                <input type="text" id="first_name" name="first_name" value="<%=emp.getFirst_name()%>" required>
            </div>
            <input type="hidden" value="<%=emp.getEmployee_id()%>" name="employee_id"/>
            <div class="form-group">
                <label for="last_name">Last Name:</label>
                <input type="text" id="last_name" name="last_name" value="<%=emp.getLast_name()%>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%=emp.getEmail()%>" required>
            </div>
            <div class="form-group">
                <label for="phone_number">Phone Number:</label>
                <input type="tel" id="phone_number" value="<%=emp.getPhone_number()%>" name="phone_number">
            </div>
            <div class="form-group">
                <label for="hire_date">Hire Date:</label>
                <input type="date" id="hire_date" name="hire_date" required>
            </div>
            <div class="form-group">
                <label for="job_title">Job Title:</label>
                <input type="text" id="job_title" name="job_title">
            </div>
            <div class="form-group">
                <label for="department">Department:</label>
                <input type="text" id="department" name="department">
            </div>
            <div class="form-group">
                <label for="salary">Salary:</label>
                <input type="number" id="salary" name="salary" step="0.01">
            </div>
            <div class="form-group">
                <label for="manager_id">Manager ID:</label>
                <input type="number" id="manager_id" name="manager_id">
            </div>
            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
