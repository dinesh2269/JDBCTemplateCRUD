package com.Dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.mapper.EmployeeMapper;
import com.model.Employee;

@Service
public class EmployeeDao {
	JdbcTemplate template;

	@Autowired
	public EmployeeDao(DataSource datasource) {
		template = new JdbcTemplate(datasource);
	}

	public List<Employee> fetchAllEmployees() {
		return template.query("select * from employee_dinesh order by employee_id asc", new EmployeeMapper());
	}

	public boolean deleteEmployee(int id) {
		return template.update("delete from employee_dinesh where employee_id=?", id) > 0;
	}

	public boolean insertEmployee(Employee emp) {
		return template.update(
				"INSERT INTO Employee_dinesh (first_name, last_name, email, phone_number) values(?,?,?,?)",
				emp.getFirst_name(), emp.getLast_name(), emp.getEmail(), emp.getPhone_number()) > 0;
	}

	public Employee fetchById(int id) {
		return template.queryForObject("select * from employee_dinesh where employee_id=?", new Object[] { id },
				new EmployeeMapper());
	}

	public boolean updateEmployee(Employee emp) {
		return template.update(
				"update Employee_dinesh set first_name=?, last_name=?, email=?, phone_number=? where employee_id=?",
				emp.getFirst_name(), emp.getLast_name(), emp.getEmail(), emp.getPhone_number(),
				emp.getEmployee_id()) > 0;

	}
}
