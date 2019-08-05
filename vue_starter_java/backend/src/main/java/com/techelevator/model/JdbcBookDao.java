package com.techelevator.model;
	
	
	import java.util.ArrayList;
	import java.util.List;

	import javax.sql.DataSource;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.jdbc.core.JdbcTemplate;
	import org.springframework.jdbc.support.rowset.SqlRowSet;
	import org.springframework.stereotype.Component;



	@Component
	public class JdbcBookDao implements BookDao{

	    private JdbcTemplate jdbcTemplate;
		
	    @Autowired
	    public JdbcBookDao(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	      
	    }
		
		@Override
		public List<Book> getAllBooks() {
			
			List<Book> book = new ArrayList<Book>();
			
			String sqlGetAllBooks = "SELECT * FROM  book ";
			
			SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllBooks);

			Book theBooks; 
			
			while (results.next()) {
				theBooks = mapRowToBook(results);
				book.add(theBooks);
			}
			return book;
			
			
			
		}
		private Book  mapRowToBook(SqlRowSet results) {
			
			Book theBook; 
			
			theBook = new Book();
			theBook.setAuthor(results.getString("author"));
			theBook.setDescription(results.getString("description"));
			theBook.setGenre(results.getString("genre"));
			theBook.setPublishDate(results.getDate("publishDate"));
			theBook.setTitle(results.getString("title"));
			theBook.setCharacters(getCharacters(results.getInt("id")));
			
			return theBook;
		}

		private String[] getCharacters(int id) {
			// TODO Auto-generated method stub
			return null;
		}

	}
		
		



