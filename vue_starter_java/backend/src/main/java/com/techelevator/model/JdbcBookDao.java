package com.techelevator.model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcBookDao implements BookDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcBookDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);

	}

	@Override
	public List<Book> getAllBooks() {
		List<Book> book = new ArrayList<Book>();
		String sqlGetAllBooks = "SELECT * FROM  books ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllBooks);
		Book theBooks;
		while (results.next()) {
			theBooks = mapRowToBook(results);
			book.add(theBooks);
		}
		return book;
	}
	
	@Override
	public List<Book> getAllBooksFromReadingList(int userId) {
		List<Book> books = new ArrayList<Book>();
		String result = "SELECT * FROM  books ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(result, userId);
		Book theBooks;
		while (results.next()) {
			theBooks = mapRowToBook(results);
			books.add(theBooks);
		}
		return books;

	}
	@Override
	public Book getBookById(int bookId) {
		Book book = new Book();
		String getBook = "SELECT * FROM books WHERE book_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(getBook, bookId);
		
		if(result.next()) {
		book = mapRowToBook(result);
		}
		return book;	
	}

	private Book mapRowToBook(SqlRowSet results) {

		Book theBook;

		theBook = new Book();
		theBook.setId(results.getLong("book_id"));
		theBook.setAuthor(results.getString("author"));
		theBook.setDescription(results.getString("description"));
		theBook.setGenre(results.getString("genre"));
		theBook.setTitle(results.getString("title"));
		theBook.setPublishDate(results.getDate("publish_date"));
		theBook.setDateAdded(results.getDate("date_added"));
		theBook.setImgUrl(results.getString("img_url"));
		theBook.setIsbn(results.getString("isbn"));

		return theBook;
	}

	private String[] getCharacters(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void save(Book book) {
		// TODO Auto-generated method stub
		
		
		Long id = getNextId();
		String sqlSave = "INSERT INTO books (book_id,title,author,genre,description,publish_date,date_added,img_url,isbn ) " + 
				"VALUES (?,?,?,?,?,?,?,?,?)";
		
		jdbcTemplate.update(sqlSave, id, book.getTitle(), book.getAuthor(),book.getGenre(),book.getDescription(),book.getPublishDate(),
				book.getDateAdded(),book.getImgUrl(), book.getIsbn());
		book.setId(id);
	}


	private Long getNextId() {

		String sqlSelectNextId = "SELECT nextval('books_book_id_seq')";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectNextId);
		Long id = null;
		if (results.next()) {
			id = results.getLong(1);
		} else {
			throw new RuntimeException("Something strange happened, unable to select next forum post id from sequence");
		}
		return id;
	}

	

}
