<template>
	<div class="books">
		<h1>books page</h1>
		<div v-for="book in books" :key="book.id">
			<book-row v-bind:book="book" />
		</div>
	</div>
</template>

<script>
import axios from "axios";
import BookRow from "@/components/BookRow.vue";

export default {
	name: "books",
	components: {
		BookRow
	},
	data() {
		return {
			API_URL: "https://5d4878d22d59e50014f20bf1.mockapi.io/library",
			books: []
		};
	},
	methods: {
		getAllBooks() {
			axios.get(this.API_URL)
				.then(response => {
					this.books = response.data;
					console.log(this.books);
				})
				.catch(err => console.error(err));
		},
		fetchAllBooks() {
			fetch(this.API_URL)
				.then(response => {
					return response.json();
				})
				.then(books => {
					this.books = books;
					console.log(this.books);
				});
		}
	},
	created() {
		this.fetchAllBooks();
	}
};
</script>

<style>
</style>
