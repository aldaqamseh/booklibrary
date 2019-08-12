package com.techelevator.model;

import java.util.List;



public interface BookDao {
	
	 List<Book> getAllBooks();
	 
	 void save(Book saveBook);
	 
	 Book getBookById(int bookId);

	List<Book> getAllBooksFromReadingList(int userId);

	void saveBookToReadingList(Book book, int userId);

	
}
