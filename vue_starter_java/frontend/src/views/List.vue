<template>
	<div class="reading-list text-center container">
		<h1 class="text-center" v-if="isLoggedIn">Your Reading List</h1>
		<h4 class="text-center" v-if="this.books.length == 0"> Hmm.. there doesn't seem to be anything here. </h4>
		<a href="/books"><h5 class="text-center" v-if="this.books.length == 0"> Why not add your first book?</h5></a>



		<div class ="list-not-logged-in" v-if="!isLoggedIn">
			<br>
		<h1 class="text-center"> You must be logged in to start a reading list!</h1>
		<br>
			<a href="/register"><button class="btn btn-primary">
						Join today!
					</button></a> or 
					<a href="/login"><button class="btn btn-primary">
						Login
					</button></a>

		</div>
	
	


		<div v-for="book in books" :key="book.id">
			<list-row :book="book" @remove="fetchAllBooks"/>
		</div>
	</div>
</template>

<script>
import auth from "../auth";
import ListRow from "@/components/ListRow.vue";

export default {
	computed: {
		isLoggedIn(){
			return auth.getUser()
		}
	},
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
