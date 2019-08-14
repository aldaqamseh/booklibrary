package com.techelevator.authentication;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.Comments;
import com.techelevator.model.CommentsDao;
import com.techelevator.model.JdbcCommentsDao;
import com.techelevator.model.JdbcPostDao;
import com.techelevator.model.JdbcUserDao;
import com.techelevator.model.Post;
import com.techelevator.model.PostDao;
import com.techelevator.model.User;
import com.techelevator.model.UserDao;

public class JdbcCommentsDaoInegrationTest extends DAOIntegrationTest {

	private CommentsDao daoComment = new JdbcCommentsDao(getDataSource());
	private PostDao daoPost = new JdbcPostDao(getDataSource());
	
	private UserDao daouser = new JdbcUserDao(getDataSource(), null);
	
	private JdbcTemplate template;
	private Comments testComment1;
	private Comments testComment2;
	private Comments testComment3;
	private User user;
	
	private Post testPost;
	@Before
	public void setup() {
		
		daoComment = new JdbcCommentsDao(getDataSource());
		template = new JdbcTemplate(getDataSource());
		
		testPost = new Post();
		testPost.setBody("test body");
		testPost.setId(2);
		testPost.setTitle("test title");
		testPost.setUser("kt123");
		testPost.setDatePosted(new Date(1989-8-06));
		
		daoPost.save(testPost);
		
		testComment1 = new Comments();
		testComment2 = new Comments();
		testComment3 = new Comments();
		
		testComment1.setBody("test comments1 body");
		testComment1.setDatePosted(new Date(1989-8-06));
		testComment1.setUser("Moh123");
		testComment1.setPostId(2);
		
		testComment2.setBody("test comments2 body");
		testComment2.setDatePosted(new Date(1989-8-06));
		testComment2.setUser("Luke123");
	}
//	@Test
//	public void assertCommentsAreEqual() {
//		List<Comments> getList1 = new ArrayList<>();
//		List<Comments> getList2 = new ArrayList<>();
//	getList1.addAll(doaComment)
//		daoComment.save(testComment1);
//	}
}


