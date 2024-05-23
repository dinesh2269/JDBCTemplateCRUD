package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.Dao.EmployeeDao;
import com.model.Employee;

@Controller
public class ControllerClass {

	@Autowired
	EmployeeDao emp;

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String getAllEmployees(Model m) {
		List<Employee> list = emp.fetchAllEmployees();
		m.addAttribute("employees_list", list);

		return "employees";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.DELETE)
	public void deleteEmployee(@RequestParam int id) {
		System.out.println(id);
		boolean b = emp.deleteEmployee(id);
		System.out.println("success");
	}

}
