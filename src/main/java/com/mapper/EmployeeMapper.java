package com.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.model.Employee;

public class EmployeeMapper implements RowMapper<Employee> {

	@Override
	public Employee mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Employee ob = new Employee();
		ob.setEmployee_id(rs.getInt("employee_id"));
		ob.setFirst_name(rs.getString("first_name"));
		ob.setLast_name(rs.getString("last_name"));
		ob.setEmail(rs.getString("email"));
		ob.setPhone_number(rs.getString("phone_number"));
		return ob;
	}

}
