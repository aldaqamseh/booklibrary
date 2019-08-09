package com.techelevator.model;

import java.util.List;

public interface PostDao {
	
 List<Post> getAllPostsByPostId(Long postId);
	 
	 void save(Post savePost);

}
