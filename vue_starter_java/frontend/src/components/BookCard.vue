<template>
	<div>
		<div class="col col-auto card-col pb-4">
			<router-link
				:to="{
					path: 'books/' + bookID,
					params: { bookId: bookID }
				}"
				tag="div"
				class="book-link"
			>
				<div
					class="card d-flex align-items-center justify-content-center text-center pt-2 mx-3"
				>
					<img
						v-if="book.imgUrl"
						:src="book.imgUrl"
						class="book-img"
					/>
					<img
						v-else
						src="https://place-hold.it/163x218"
						class="book-img"
					/>
					<div
						class="card-body d-flex flex-column justify-content-center"
					>
						<h5>{{ book.title }}</h5>

						<p>By: {{ book.author }}</p>
					</div>
				</div>
			</router-link>
		</div>
	</div>

	<!-- <div class="book-row">
		<div class="row justify-content-center align-items-center mb-4">
			<div class="col col-3">
				<p class="text-center">
					<img v-if="book.imgURL" :src="book.imgURL" />
					<img v-else src="https://place-hold.it/163x218" />
				</p>
			</div>
			<div class="col col-9">
				<h5>{{ book.title }}</h5>
				<p>
					<span class="author"> Author: {{ book.author }} </span>
					<span class="date-published">
						{{ book.publishDate.substring(0, 10) }}</span
					>
				</p>
				<p class="description">{{ book.description }}</p>
			</div>
		</div>
  </div>-->
</template>

<script>
export default {
	name: "book-card",
	data() {
		return {
			bookID: this.book.id
		};
	},
	props: {
		book: Object
	}
};
</script>

<style scoped>
.book-link:hover {
	cursor: pointer;
}
.book-img {
	width: 60%;
	margin: auto;
}

.col {
	width: 300px;
}
.card {
	width: 100%;
}
.card-body h5 {
	max-width: 150px;
	font-size: 1rem;
}
</style>
