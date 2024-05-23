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
		return template.query("select * from employee_dinesh", new EmployeeMapper());
	}

	public boolean deleteEmployee(int id) {
		return template.update("delete from employee_dinesh where employee_id=?", id) > 0;
	}
}
