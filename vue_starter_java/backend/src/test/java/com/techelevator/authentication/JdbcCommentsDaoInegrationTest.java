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
import com.techelevator.model.Comments;
import com.techelevator.model.CommentsDao;
import com.techelevator.model.JdbcBookDao;
import com.techelevator.model.JdbcCommentsDao;

public class JdbcCommentsDaoInegrationTest extends DAOIntegrationTest {

	private CommentsDao dao = new JdbcCommentsDao(getDataSource());
	
	private JdbcTemplate template;
	private Comments testComment1;
	private Comments testComment2;
	private Comments testComment3;
	@Before
	public void setup() {
		
		dao = new JdbcCommentsDao(getDataSource());
		template = new JdbcTemplate(getDataSource());
		
		testComment1 = new Comments();
		testComment2 = new Comments();
		testComment3 = new Comments();
		
		testComment1.setBody("test comments1 body");
		testComment1.setDatePosted(new Date(1989-8-06));
		testComment1.setUserId((long) 15);
		testComment1.setPostId((long) 14);
		
		testComment2.setBody("test comments2 body");
		testComment2.setDatePosted(new Date(1989-8-06));
		testComment2.setUserId((long) 16);
	}
	@Test
	public void assertBooksAreEqual() {
		List<Comments> getList1 = new ArrayList<>();
		List<Comments> getList2 = new ArrayList<>();
		//getList2.addAll(dao.getAllCommentsByPostId((long) 1));
		//dao.save(testComment2);
		dao.save(testComment1);
	}
}


/*
	
	
	@Test
	public void assertBooksAreEqual() {
		List<Book> getList1 = new ArrayList<>();
		List<Book> getList2 = new ArrayList<>();
		
		getList2.addAll(dao.getAllBooks());
		
		
		dao.save(testBook2);
		dao.save(testBook1);
		getList1.addAll(dao.getAllBooks());

		testBook3 = getList1.get(getList1.size()-1);
		
		assertEquals(getList1.size(), getList2.size()+2);
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
*/