<template>
	<div>
		<div class="col col-auto card-col pb-4">
			<div class="card text-center pt-2">
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
				<div class="card-body">
					<router-link
						:to="{
							path: 'books/' + bookID,
							params: { bookId: bookID }
						}"
					>
						click
					</router-link>
					<h5>{{ book.title }}</h5>
					<p>{{ book.author }}</p>
				</div>
			</div>
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
.book-img {
	width: 50%;
	margin: auto;
}

.card-body h5 {
	max-width: 150px;
}
</style>
