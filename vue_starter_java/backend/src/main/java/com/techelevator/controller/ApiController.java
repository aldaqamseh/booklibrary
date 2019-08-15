package com.techelevator.controller;

import java.util.ArrayList;
import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.postgresql.util.LruCache.CreateAction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.util.UriComponents;

import com.techelevator.authentication.AuthProvider;
import com.techelevator.exceptions.BookNotFoundException;
import com.techelevator.exceptions.PostNotFoundException;
import com.techelevator.model.Book;
import com.techelevator.model.BookDao;
import com.techelevator.model.Comments;
import com.techelevator.model.CommentsDao;
import com.techelevator.model.Post;
import com.techelevator.model.PostDao;
import com.techelevator.model.User;
import com.techelevator.model.UserDao;

@CrossOrigin
@RestController
@RequestMapping("/api")
public class ApiController {

	@Autowired
	private AuthProvider authProvider;
	@Autowired
	private BookDao bookDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private PostDao postDao;
	@Autowired
	private CommentsDao commentsDao;

	//
	// @RequestMapping(path = "/", method = RequestMethod.GET)
	// public String authorizedOnly() throws UnauthorizedException {
	// /*
	// You can lock down which roles are allowed by checking
	// if the current user has a role.
	//
	// In this example, if the user does not have the admin role
	// we send back an unauthorized error.
	// */
	// if (!authProvider.userHasRole(new String[] { "admin" })) {
	// throw new UnauthorizedException();
	// }
	// return "Success";
	// }

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

	@GetMapping("/books/{bookId}")
	public Book getBookById(@PathVariable int bookId) {
		Book book = bookDao.getBookById(bookId);

		if (book != null) {
			return book;
		}
		throw new BookNotFoundException(bookId, "Book could not be found.");
	}

	@GetMapping("/reading-list")
	public List<Book> getReadingList() {

		User currentUser = authProvider.getCurrentUser();
		int userId = (int) currentUser.getId();
		List<Book> readingList = bookDao.getAllBooksFromReadingList(userId);

		return readingList;
	}

	@PostMapping("/reading-list")
	public void addToReadingList(@RequestBody Book book) {

		User currentUser = authProvider.getCurrentUser();
		int userId = (int) currentUser.getId();
		String bookToAddTitle = book.getTitle();
		System.out.println(bookToAddTitle);
		List<Book> allBooks = bookDao.getAllBooksFromReadingList(userId);

		if (!titleList(allBooks).contains(book.getTitle())) {
			bookDao.saveBookToReadingList(book, userId);
		}
	}

	@PutMapping("/reading-list")
	public void updateReadingList(@RequestBody Book book) {
		User currentUser = authProvider.getCurrentUser();
		int userId = (int) currentUser.getId();
		
		bookDao.updateReadingList(book, userId);
	}
	
	@GetMapping("/forum")
	public List<Post> getPosts() {
		return postDao.getAllPosts();
	}

	@GetMapping("/forum/{postId}")
	public Post getPostById(@PathVariable int postId) {
		Post post = (Post) postDao.getAllPostsByPostId(postId);

		if (post != null) {
			return post;
		}
		throw new PostNotFoundException(postId, "Book could not be found.");
	}

	@PostMapping("/forum")
	public void addToForum(@RequestBody Post post) {
		postDao.save(post);
	}

	@GetMapping("/forum/{postId}/comments")
	public List<Comments> getCommentsByPost(@PathVariable int postId) {
		return commentsDao.getAllCommentsByPostId(postId);

	}

	@PostMapping("forum/{postId}/comments")
	public void addToComments(@RequestBody Comments comment) {
		commentsDao.save(comment);
	}

	@DeleteMapping("/reading-list")
	public void deleteFromReadingList(@RequestBody Book book) {
		User currentUser = authProvider.getCurrentUser();
		int userId = (int) currentUser.getId();
		List<Book> allBooks = bookDao.getAllBooksFromReadingList(userId);
		if (titleList(allBooks).contains(book.getTitle())) {
		bookDao.removeBookFromReadingList(book, userId);
		}
	}
	
	private boolean bookTitleExists(List<Book> books, String title) {
		boolean titlesMatch = false;
		while (!titlesMatch) {
			for (Book book : books) {
				if (book.getTitle().equals(title)) {
					titlesMatch = true;
				}
			}
		}
		return titlesMatch;
	}

	private List<String> titleList(List<Book> allBooks) {
		List<String> newList = new ArrayList<String>();
		for (Book book : allBooks) {
			newList.add(book.getTitle());
		}
		return newList;
	}

}