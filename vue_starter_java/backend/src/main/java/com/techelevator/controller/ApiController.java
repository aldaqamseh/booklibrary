package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

import com.techelevator.model.Book;
import com.techelevator.model.BookDao;

@CrossOrigin
@RestController
@RequestMapping("/api")
public class ApiController {

	@Autowired
//    private AuthProvider authProvider;
	private BookDao bookDao;
//
//    @RequestMapping(path = "/", method = RequestMethod.GET)
//    public String authorizedOnly() throws UnauthorizedException {
//        /*
//        You can lock down which roles are allowed by checking
//        if the current user has a role.
//        
//        In this example, if the user does not have the admin role
//        we send back an unauthorized error.
//        */
//        if (!authProvider.userHasRole(new String[] { "admin" })) {
//            throw new UnauthorizedException();
//        }
//        return "Success";
//    }

	@GetMapping("/books")
	public List<Book> getBooks() {
		return bookDao.getAllBooks();
	}

	@PostMapping("/books")
	public ResponseEntity<Book> createProductReview(@RequestBody Book book) {
		bookDao.save(book);
		UriComponents uriComponent = ServletUriComponentsBuilder.fromCurrentRequestUri()
				.path("/" + Long.toString(book.getId())).build();
		return ResponseEntity.created(uriComponent.toUri()).body(book);
	}

}