<template>
	<div class="text-center">
		<h1>{{book.title}}</h1>
		<h3>{{ book.author }}</h3>
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

				<h3>{{book.genre}}</h3>
				<h3>{{book.publishDate}}</h3>
				<p>{{book.description}}</p>
	</div>
</template>

<script>
export default {
	data() {
		return {
			book: {},
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/books/"
		};
	},
	props: {
		bookId: String
	},
	methods: {
		fetchBookById() {
			fetch(this.API_URL + this.$route.params.bookId)
				.then(response => {
					return response.json();
				})
				.then(book => {
					this.book = book;
				});
		}
	},
	created() {
		this.fetchBookById();
	}
};
</script>

<style>
</style>
