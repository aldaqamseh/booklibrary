package com.techelevator.model;

import java.util.List;

public interface PostDao {
	
 List<Post> getAllPostsByPostId(int postId);
 List<Post> getAllPosts();
	 
	 void save(Post savePost);

}
