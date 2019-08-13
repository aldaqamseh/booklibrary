<template>
	<div class="book-details">
		<div class="container">
			<div class="details-wrapper p-3 mt-5">
				<div class="row">
					<div
						class="col col-11 col-md-6 d-flex justify-content-center"
					>
						<img
							v-if="book.imgUrl"
							:src="book.imgUrl"
							class="book-image"
						/>
						<img
							v-else
							src="https://place-hold.it/163x218"
							class="book-image"
						/>
					</div>
					<div
						class="col col-11 col-md-6 d-flex flex-column justify-content-center"
					>
						<h1 class="text-center text-md-left">
							{{ book.title }}
						</h1>
						<h5 class="text-center text-md-left">
							By: {{ book.author }}
						</h5>
						<div class="book-description mt-3">
							<p>
								{{ book.description }}
							</p>
							<p class="publish-date text-right">
								Date Published: {{ book.publishDate }}
							</p>
						</div>
					</div>
				</div>
				<div class="text-center my-5">
					<router-link to="/books"
						>Back to Book List</router-link
					>
				</div>
					<div class="text-center my-5">
					<button @click='addBookToReadingList'>
						Add Book To Reading List
					</button>
				</div>
			</div>
		</div>
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
					console.log(book);
				});
		},
		addBookToReadingList: function(){
			fetch("http://localhost:8080/AuthenticationApplication/api/reading-list", {
				method: "POST",
				mode: "cors",
				headers: {
					Accept: 'application/json',
					'Content-Type': 'application/json',
					Authorization: "Bearer " + auth.getToken()
				},
					body: JSON.stringify(this.book)

			})
				.then(res => res.json())
				.then(res => console.log(res));
		}
	},
	created() {
		this.fetchBookById();
	}
};
</script>

<style>
.details-wrapper {
	/* border: 1px solid black; */
}
.book-image {
	width: 70%;
	margin: auto;
}
</style>
