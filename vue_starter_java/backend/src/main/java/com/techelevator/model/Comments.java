package com.techelevator.model;

public class Comments extends ForumEntry{

	private Long postId;
	
	
public String toString() {
	return this.getTitle();
	
	
	
}


public Long getPostId() {
	return postId;
}


public void setPostId(Long postId) {
	this.postId = postId;
}


}
