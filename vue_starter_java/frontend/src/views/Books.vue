<template>
	<div class="books">
		<h1>books page</h1>
		<search-books v-on:search="handleFilter" />
		<div v-for="book in filteredBooks" :key="book.id">
			<book-row v-bind:book="book" />
		</div>
	</div>
</template>

<script>
import axios from "axios";
import BookRow from "@/components/BookRow.vue";
import SearchBooks from "@/components/SearchBooks.vue";

export default {
	name: "books",
	components: {
		BookRow,
		SearchBooks
	},
	data() {
		return {
			API_URL: "https://5d4878d22d59e50014f20bf1.mockapi.io/library",
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
