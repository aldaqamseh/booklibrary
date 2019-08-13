package com.techelevator.model;

import java.util.List;

public interface CommentsDao {

	
	 List<Comments> getAllCommentsByPostId(int postId);
	 List<Comments> getAllComments();
	 
	 void save(Comments saveComment);

	
}
