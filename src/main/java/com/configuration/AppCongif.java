package com.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@PropertySource("classpath:db.properties")
public class AppCongif {
	@Autowired
	Environment env;

	private String url = "db_url";
	private String user = "db_user";
	private String password = "db_password";
	private String driver = "db_driver";

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource datasource = new DriverManagerDataSource();
		datasource.setUrl(env.getProperty(url));
		datasource.setUsername(env.getProperty(user));
		datasource.setPassword(env.getProperty(password));
		datasource.setDriverClassName(env.getProperty(driver));
		return datasource;
	}
}
