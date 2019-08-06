package com.techelevator.model;

import java.util.List;



public interface BookDao {
	
	 List<Book> getAllBooks();
	 
	 void save(Book saveBook);

	 Long getNextId();
}
