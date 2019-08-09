package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcPostDao implements PostDao {
	
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcPostDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}
	

	@Override
	public List<Post> getAllPostsByPostId(Long postId) {
		
	
		// TODO Auto-generated method stub
		List<Post> posts = new ArrayList<Post>();
		String sqlGetAllPostsByPostId = "SELECT * FROM forum_posts WHERE id ILIKE ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllPostsByPostId, postId);
		
		Post thePost;
		while(results.next()) {
			thePost = mapRowToPosts(results);
			posts.add(thePost);
		}
		
		return posts;
	}

	private Post mapRowToPosts(SqlRowSet results) {
	
		Post thePost;
		thePost = new Post();
		thePost.setId(results.getLong("id"));
		thePost.setUserId(results.getLong("user_id"));
		thePost.setTitle(results.getString("title"));
		thePost.setBody(results.getString("body"));
		thePost.setDatePosted(results.getDate("date_posted"));
		
		return thePost;
	}


	@Override
	public void save(Post savePost) {
	
		Long id = getNextId();
		String sqlSave = "INSERT INTO forum_posts (id,user_id,title,body,date_psted ) " +
				"values (?,?,?,?,?)";

		jdbcTemplate.update(sqlSave, id, savePost.getUserId(),savePost.getTitle(),savePost.getBody(),savePost.getDatePosted());
		savePost.setId(id);
		
	}


	private Long getNextId() {
		String sqlSelectNextId = "SELECT nextval('forum_posts_id_seq')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if (results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
		}
		return id;
	}
	}

