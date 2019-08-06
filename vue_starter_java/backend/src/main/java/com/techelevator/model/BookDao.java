package com.techelevator.model;

import java.util.List;

import org.springframework.stereotype.Component;


public interface BookDao {
	
	 List<Book> getAllBooks();
	 
	 void save(Book saveBook);

	
}
