<template>
	<div class="books">
		<h1>Current books in stock at bkwrm</h1>
		<search-books v-on:search="handleFilter" />
		<div class="row justify-content-around align-items-stretch">
			<div
				v-for="book in filteredBooks.slice().reverse()"
				:key="book.id"
			>
				<book-card v-bind:book="book" />
			</div>
		</div>
	</div>
</template>

<script>
import axios from "axios";
import BookCard from "@/components/BookCard.vue";
import SearchBooks from "@/components/SearchBooks.vue";

export default {
	name: "books",
	components: {
		BookCard,
		SearchBooks
	},
	data() {
		return {
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/books",
			books: [],
			query: ""
		};
	},
	methods: {
		fetchAllBooks() {
			fetch(this.API_URL)
				.then(response => {
					return response.json();
				})
				.then(books => {
					this.books = books;
					console.log(this.books);
				});
		},
		handleFilter(filterText) {
			this.query = filterText;
		}
	},
	computed: {
		filteredBooks() {
			let filter = new RegExp(this.query, "i");
			return this.books.filter(
				book =>
					book.title.match(filter) ||
					book.author.match(filter) ||
					book.description.match(filter)
			);
		}
	},
	created() {
		this.fetchAllBooks();
	}
};
</script>

<style>
</style>
