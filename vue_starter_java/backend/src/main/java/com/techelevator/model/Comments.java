package com.techelevator.model;

public class Comments extends ForumEntry{

	private int postId;
	
	
public String toString() {
	return this.getTitle();
	
	
	
}


public int getPostId() {
	return postId;
}


public void setPostId(int postId) {
	this.postId = postId;
}




}
