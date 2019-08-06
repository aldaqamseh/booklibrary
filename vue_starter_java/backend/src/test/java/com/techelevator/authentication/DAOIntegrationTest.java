package com.techelevator.authentication;

import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.*;
public abstract class DAOIntegrationTest {
	
	private static SingleConnectionDataSource dataSource;
	
	@BeforeClass
	public static void setUpDataSource() {
		
		dataSource = new SingleConnectionDataSource();
		dataSource.setUrl("jdbc:postgresql://localhost:5432/library");
		dataSource.setUsername("postgres");
		dataSource.setPassword("postgres1");
		dataSource.setAutoCommit(false);
		
	}
	
	@AfterClass
	public static void closeDataSource() throws SQLException {
	dataSource.destroy();
	}
	
	@After
	public void rollback() throws SQLException {
	dataSource.getConnection().rollback();
	}
	
	public DataSource getDataSource() {
		return dataSource;
		}
	
	
	

}
