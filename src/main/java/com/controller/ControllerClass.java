package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
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
		boolean b = emp.deleteEmployee(id);
	}

	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
	public String getAddUserJSP() {
		return "addUserJSP";
	}

	@RequestMapping(value = "/insert_employee", method = RequestMethod.POST)
	public String insertEmployee(@Validated Employee employee, Model m) {
		emp.insertEmployee(employee);
		List<Employee> list = emp.fetchAllEmployees();
		m.addAttribute("employees_list", list);
		return "employees";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String getEditJsp(@RequestParam int id, Model model) {
		Employee employee = emp.fetchById(id);
		model.addAttribute("employee", employee);
		return "edit";
	}

	@RequestMapping(value = "/update_employee", method = RequestMethod.POST)
	public String updateEmployee(Employee employee, Model m) {
		boolean b = emp.updateEmployee(employee);
		List<Employee> list = emp.fetchAllEmployees();
		m.addAttribute("employees_list", list);
		return "employees";
	}

}
