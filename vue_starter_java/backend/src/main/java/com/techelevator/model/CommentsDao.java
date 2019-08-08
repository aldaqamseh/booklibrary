package com.techelevator.model;

import java.util.List;

public interface CommentsDao {

	
	 List<Comments> getAllCommentsByPostId(Long postId);
	 
	 void save(Comments saveComment);

	
}
