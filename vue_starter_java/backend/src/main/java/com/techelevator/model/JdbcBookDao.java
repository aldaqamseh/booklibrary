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

//		Park thePark;
//		thePark = new Park();
//		thePark.setParkName(results.getString("parkname"));
//		thePark.setParkCode(results.getString("parkcode"));
//		thePark.setState(results.getString("state"));
//		thePark.setAcreage(results.getInt("acreage"));
//		thePark.setElevation(results.getInt("elevationinfeet"));
//		thePark.setMilesOfTrial(results.getDouble("milesoftrail"));
//		thePark.setNumberOfCampSites(results.getInt("numberofcampsites"));
//		thePark.setClimate(results.getString("climate"));
//		thePark.setYeareFounded(results.getInt("yearfounded"));
//		thePark.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
//		thePark.setQuote(results.getString("inspirationalquote"));
//		thePark.setQuoteSource(results.getString("inspirationalquotesource"));
//		thePark.setParkDescription(results.getString("parkdescription"));
//		thePark.setEntryFee(results.getInt("entryfee"));
//		thePark.setNumberOfAnimals(results.getInt("numberofanimalspecies"));
//
//		return thePark;
	}

}
	
	
