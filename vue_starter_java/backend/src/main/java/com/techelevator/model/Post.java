package com.techelevator.model;


import java.util.List;

public class Post extends ForumEntry{
	
	
	private List<Comments> comments;

	public List<Comments> getComments() {
		return comments;
	}

	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}
	
	

	
	

}
