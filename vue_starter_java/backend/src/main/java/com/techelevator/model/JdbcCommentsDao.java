package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcCommentsDao implements CommentsDao{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcCommentsDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}
	
	
	@Override
	public List<Comments> getAllCommentsByPostId(Long postId) {
	
		

		List<Comments> comments = new ArrayList<Comments>();
		
		String sqlGetAllCommentsByPostId = "SELECT * FROM forum_comments WHERE post_id ILIKE ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCommentsByPostId, postId);
		
		Comments theComment;
		while(results.next()) {
			theComment = mapRowToComments(results);
			comments.add(theComment);
		}
		
		return comments;
	}

	private Comments mapRowToComments(SqlRowSet results) {
	
		Comments theComment;
		theComment = new Comments();
		theComment.setBody(results.getString("body"));
		theComment.setPostId(results.getLong("post_id"));
		theComment.setId(results.getLong("id"));
		
		
		return theComment;
	}


	@Override
	public void save(Comments saveComment) {
	
		
		
		Long id = getNextId();
		
		String sqlSave = "INSERT INTO forum_comments (id,post_id,user_id,body,date_psted ) " +
						"values (?,?,?,?,?)";
		
		jdbcTemplate.update(sqlSave, id,saveComment.getPostId(),saveComment.getBody(),saveComment.getDatePosted());
		saveComment.setId(id);
		
		
	}
	
	private Long getNextId() {

		String sqlSelectNextId = "SELECT nextval('forum_comments_id_seq')";
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
