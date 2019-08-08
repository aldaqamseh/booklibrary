<template>
	<div class="add-book">
		<h1>Add a new book to bkwrm&#8482;</h1>
		<form v-on:submit.prevent>
			<div class="form-group">
				<label for="title">Book Title</label>
				<input
					type="text"
					class="form-control"
					id="title"
					v-model="newBook.title"
					placeholder="Enter a title"
				/>
			</div>

			<div class="form-group">
				<label for="author">Author</label>
				<input
					type="text"
					class="form-control"
					id="author"
					v-model="newBook.author"
					placeholder="Enter the author name"
				/>
			</div>

			<div class="form-group">
				<label for="genre">Genre</label>
				<input
					type="text"
					class="form-control"
					id="genre"
					v-model="newBook.genre"
					placeholder="Enter the genre"
				/>
			</div>

			<div class="form-group">
				<label for="publishDate">Publish Date</label>
				<input
					type="date"
					class="form-control"
					id="publishDate"
					v-model="newBook.publishDate"
					placeholder="10/17/1989"
				/>
			</div>
			<div class="form-group">
				<label for="imgUrl">Image URL</label>
				<input
					type="url"
					class="form-control"
					id="imgUrl"
					v-model="newBook.imgUrl"
					placeholder="http://www.example.com"
				/>
			</div>

			<div class="form-group">
				<label for="isbn">ISBN</label>
				<input
					type="text"
					class="form-control"
					id="isbn"
					v-model="newBook.isbn"
					placeholder="Enter the ISBN"
				/>
			</div>

			<div class="form-group">
				<label for="description"> Description</label>
				<textarea
					class="form-control"
					id="description"
					v-model="newBook.description"
					placeholder="Enter a description"
				/>
			</div>
			<button
				type="submit"
				class="btn btn-primary"
				data-toggle="modal"
				data-target="#confirmModal"
			>
				Submit
			</button>
		</form>
		<confirm-modal :newBook="newBook"> </confirm-modal>
	</div>
</template>

<script>
import ConfirmModal from "@/components/ConfirmModal.vue";
import moment from "moment";

export default {
	data() {
		return {
			newBook: {
				title: " ",
				author: " ",
				genre: " ",
				description: " ",
				publishDate: " ",
				imgUrl: " ",
				isbn: " ",
				dateAdded: moment().format("YYYY-MM-DD")
			}
		};
	},
	components: {
		ConfirmModal
	}
};
</script>

<style>
</style>
