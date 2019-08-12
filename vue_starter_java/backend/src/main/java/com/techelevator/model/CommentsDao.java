package com.techelevator.model;

import java.util.List;

public interface CommentsDao {

	
	 List<Comments> getAllCommentsByPostId(Long postId);
	 List<Comments> getAllComments();
	 
	 void save(Comments saveComment);

	
}
