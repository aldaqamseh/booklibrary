package com.techelevator.authentication;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.sql.Date;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.Book;
import com.techelevator.model.BookDao;
import com.techelevator.model.JdbcBookDao;

public class JDBCBookDaoIntegrationTest extends DAOIntegrationTest{

	

	
	private BookDao dao = new JdbcBookDao(getDataSource());
	private JdbcTemplate template;
	
	
	private Book testBook1;
	
	private Book testBook2;
	
	
	@Before
	public void setup() {
	dao = new JdbcBookDao(getDataSource());
	template = new JdbcTemplate(getDataSource());
	testBook1 = new Book();
	testBook2 = new Book();
	testBook1.setTitle("Test 1");
	testBook1.setAuthor("One Author");
	testBook1.setGenre("Horror");
	testBook1.setDescription("A very long test");
	testBook1.setPublishDate(new Date(1989-8-06));
	testBook1.setDateAdded(new Date(2019-8-06));
	testBook1.setIsbn("123");

	testBook2.setTitle("Test 2");
	testBook2.setAuthor("Two Author");
	testBook2.setGenre("Horror");
	testBook2.setDescription("A very very long test");
	testBook2.setPublishDate(new Date(1989-8-06));
	testBook2.setDateAdded(new Date(2019-8-06));
	testBook2.setIsbn("456");
	
	

	}
	
	
	@Test
	public void test() {
		fail("Not yet implemented"); 
	}
	private void assertBooksAreEqual(Book expected, Book actual) {
		assertEquals(expected.getAuthor(), actual.getAuthor());
//		assertEquals(expected.getLastName(), actual.getLastName());
//		assertEquals(expected.getBirthDay(), actual.getBirthDay());
//		assertEquals(expected.getGender(), actual.getGender());
//		assertEquals(expected.getHireDate(), actual.getHireDate());
	}
}
