package com.techelevator.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcCommentsDao implements CommentsDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcCommentsDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	@Override
	public List<Comments> getAllCommentsByPostId(int postId) {

		List<Comments> comments = new ArrayList<Comments>();

		String sqlGetAllCommentsByPostId = "SELECT * FROM forum_comments WHERE post_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCommentsByPostId, postId);

		Comments theComment;
		while (results.next()) {
			theComment = mapRowToComments(results);
			comments.add(theComment);
		}

		return comments;
	}

	private Comments mapRowToComments(SqlRowSet results) {

		Comments theComment;
		theComment = new Comments();
		theComment.setBody(results.getString("body"));
		theComment.setPostId(results.getInt("post_id"));
		theComment.setId(results.getInt("comment_id"));
		theComment.setDatePosted(results.getDate("date_posted"));
		theComment.setUserId(results.getInt("user_id"));

		return theComment;
	}

	@Override
	public void save(Comments saveComment) {

		int id = getNextId();

		String sqlSave = "INSERT INTO forum_comments (post_id, user_id, body, date_posted ) " + "values (?,?,?,?)";
		jdbcTemplate.update(sqlSave, saveComment.getPostId(), saveComment.getUserId(), saveComment.getBody(),
				saveComment.getDatePosted());
		saveComment.setId(id);

	}

	private int getNextId() {

		String sqlSelectNextId = "SELECT nextval('forum_comments_comment_id_seq')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		int id = 0;
		if (results.next()) {
			id = results.getInt(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
		}
		return id;
	}

	@Override
	public List<Comments> getAllComments() {
		List<Comments> comments = new ArrayList<Comments>();

		String sqlGetAllCommentsByPostId = "SELECT * FROM forum_comments";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllCommentsByPostId);

		Comments theComment;
		while (results.next()) {
			theComment = mapRowToComments(results);
			comments.add(theComment);
		}

		return comments;
	}

}
