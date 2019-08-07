package com.techelevator.authentication;


import static org.junit.Assert.assertEquals;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

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
	
	private Book testBook3;
	
	
	@Before
	public void setup() {
	dao = new JdbcBookDao(getDataSource());
	template = new JdbcTemplate(getDataSource());
	
	List<Book> getList = new ArrayList<>();
	
	
	testBook3 = new Book();
	testBook1 = new Book();
	testBook2 = new Book();
	
	testBook1.setTitle("Test 1");
	testBook1.setAuthor("One Author");
	testBook1.setGenre("Horror");
	testBook1.setDescription("A very long test");
	testBook1.setPublishDate(new Date(1989-8-06));
	testBook1.setDateAdded(new Date(2019-8-06));
	testBook1.setImgUrl("any url");
	testBook1.setIsbn("123");

	testBook2.setTitle("Test 2");
	testBook2.setAuthor("Two Author");
	testBook2.setGenre("Horror");
	testBook2.setDescription("A very very long test");
	testBook2.setPublishDate(new Date(1989-8-06));
	testBook2.setDateAdded(new Date(2019-8-06));
	testBook2.setIsbn("456");
	testBook2.setImgUrl("any url 2");
	
	
	

	dao.save(testBook2);
	dao.save(testBook1);
	getList.addAll(dao.getAllBooks());

	testBook3 = getList.get(getList.size()-1);

	}
	
	
	@Test
	public void assertBooksAreEqual() {

	
		
		
		assertEquals(testBook3.getAuthor(), testBook1.getAuthor());
		assertEquals(testBook3.getTitle(), testBook1.getTitle());
		assertEquals(testBook3.getGenre(), testBook1.getGenre());
		assertEquals(testBook3.getDescription(), testBook1.getDescription());
		assertEquals(testBook3.getPublishDate().toString(), testBook1.getPublishDate().toString());
		assertEquals(testBook3.getDateAdded().toString(), testBook1.getDateAdded().toString());
		assertEquals(testBook3.getIsbn(), testBook1.getIsbn());
		assertEquals(testBook3.getImgUrl(), testBook1.getImgUrl());
		
		
		

	}
}
