<template>
	<div class="reading-list text-center container">
		<h1 class="text-center">Your Reading List</h1>
		<div v-for="book in books" :key="book.id">
			<list-row :book="book" @remove="fetchAllBooks"/>
		</div>
	</div>
</template>

<script>
import auth from "../auth";
import ListRow from "@/components/ListRow.vue";

export default {
	data() {
		return {
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/reading-list",
			books: []
		};
	},
	components: {
		ListRow
	},
	methods: {
		fetchAllBooks() {
			fetch(this.API_URL, {
				method: "GET",
				mode: "cors",
				headers: {
					Accept: "application/json",
					"Content-Type": "application/json",
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
