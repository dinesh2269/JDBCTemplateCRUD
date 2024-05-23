<%@ page language="java" import="com.model.Employee, java.util.List" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

button {
    padding: 10px 20px;
    margin-top: 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

/* Modal */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    border-radius: 5px;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>
<body>
	
    <div class="container">
        <h1>Employee Management</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Actions
                </tr>
            </thead>
            <tbody id="employee-list">
            	<%List<Employee> list=(List<Employee>) request.getAttribute("employees_list");
            	for(Employee e:list){
            	%>
            	<tr>
            	 	<td><%=e.getEmployee_id() %></td>
		            <td><%=e.getFirst_name() %></td>
		            <td><%=e.getLast_name() %></td>
		            <td><%=e.getEmail() %></td>
		             <td><%=e.getPhone_number() %></td>
		            
		            <td>
		                <!-- <button class="edit-btn" onclick="editfun(<%=e.getEmployee_id()%>)">Edit</button>
		                	<button class="delete-btn" onclick="deletefun(<%=e.getEmployee_id()%>)">Delete</button> -->
		                 <button class="edit-btn" data-id="<%=e.getEmployee_id()%>">Edit</button>
		                <button class="delete-btn" data-id="<%=e.getEmployee_id()%>">Delete</button>
		            </td>
		            </tr>
		            <%} %>
                <!-- Employee details will be dynamically populated here -->
            </tbody>
        </table>
        <button id="add-employee-btn">Add New Employee</button>
    </div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    $('.edit-btn').on('click',()=>{
    	console.log('dfs');
    	var id=$(this).parent().attr(data-id).val();
    	console.log(id);
    });
    /* $.ajax({
			url:'delete?id='+id,
			method:'delete',
			data:{id:id},
			success:(response)=>{
			}
		});
		function deletefun(id){
			console.log(typeof(id));
			$.ajax({
				url:'delete?id='+id,
				method:'delete',
				data:{id:id},
				success:(response)=>{
					
					
				}
			});
		}
		*/
	</script>
</body>
</html>
