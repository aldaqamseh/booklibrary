<template>
	<div class="reading-list text-center">
		<h1 class="text-center">Your Reading List </h1>
		<div v-for="book in books" :key="book.id">
			<h3 class="text-center">{{ book.title }}</h3>
			<h3 class="text-center">{{ book.author }}</h3>
			<p class="text-center">{{ book.description }}</p>
            <img
					v-if="book.imgURL"
					:src="book.imgURL"
					class="book-img"
				/>
		<img
					v-else
					src="https://place-hold.it/163x218"
					class="book-img"
				/>
		</div>
	</div>
</template>

<script>
import auth from '../auth';

export default {
	data() {
		return {
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/reading-list",
			books: []
		};
	},
	methods: {
		fetchAllBooks() {
			fetch(this.API_URL, {
				method: "GET",
				mode: "cors",
				headers: {
					Accept: 'application/json',
					'Content-Type': 'application/json',
					Authorization: "Bearer " + auth.getToken()
				}
			})
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
