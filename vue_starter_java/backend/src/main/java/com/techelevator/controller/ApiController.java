package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.util.UriComponents;
import com.techelevator.exceptions.BookNotFoundException;
import com.techelevator.exceptions.PostNotFoundException;
import com.techelevator.model.Book;
import com.techelevator.model.BookDao;
import com.techelevator.model.User;
import com.techelevator.model.UserDao;

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
	
//	@GetMapping("/forums")
//	public List<Book> getAllForumPosts() {
//		return bookDao.getAllForumPosts();
//	}

	
	@PostMapping("/books")
	public ResponseEntity<Book> createProductReview(@RequestBody Book book) {
		bookDao.save(book);
		UriComponents uriComponent = ServletUriComponentsBuilder.fromCurrentRequestUri()
				.path("/" + Long.toString(book.getId())).build();
		return ResponseEntity.created(uriComponent.toUri()).body(book);
	}
	
	@GetMapping("/books/{bookId}")
	public Book getBookById(@PathVariable int bookId) {
		Book book = bookDao.getBookById(bookId);

		if (book != null) {
			return book;
		}
		throw new BookNotFoundException(bookId, "Book could not be found.");
	}

	
	@GetMapping("/reading-list")
	public List<Book> getReadingList(){
		
		return bookDao.getAllBooksFromReadingList(1);
		
//		(int) user.getId()
	}
	
	
//	@GetMapping("/forums/{postId}")
//	public Book getPostById(@PathVariable int id) {
//		Book book = forumDao.getPostById(id);
//
//		if (book != null) {
//			return book;
//		}
//
//		throw new PostNotFoundException(id, "Post could not be found.");
//	}

}