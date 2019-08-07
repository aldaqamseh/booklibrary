<template>
	<div class="add-book">
		<h1>Save A New Book to bkwrm&#8482;</h1>
		<form>
			<div class="form-group">
				<label for="title">Book Title</label>
				<input
					type="text"
					class="form-control"
					id="title"
					placeholder="Enter a title"
				/>
			</div>

			<div class="form-group">
				<label for="author">Author</label>
				<input
					type="text"
					class="form-control"
					id="author"
					placeholder="Enter the author name"
				/>
			</div>

			<div class="form-group">
				<label for="genre">Genre</label>
				<input
					type="text"
					class="form-control"
					id="genre"
					placeholder="Enter the genre"
				/>
			</div>

			<div class="form-group">
				<label for="publishDate">Publish Date</label>
				<input
					type="date"
					class="form-control"
					id="publishDate"
					placeholder="10/17/1989"
				/>
			</div>
			<div class="form-group">
				<label for="imgUrl">Image URL</label>
				<input
					type="url"
					class="form-control"
					id="imgUrl"
					placeholder="www.example.com"
				/>
			</div>

			<div class="form-group">
				<label for="isbn">ISBN</label>
				<input
					type="text"
					class="form-control"
					id="isbn"
					placeholder="Enter the ISBN"
				/>
			</div>

			<div class="form-group">
				<label for="description"> Description</label>
				<textarea
					class="form-control"
					id="description"
					placeholder="Enter a description"
				/>
			</div>
		</form>
		<confirm-modal />
	</div>
</template>

<script>
import ConfirmModal from "@/components/ConfirmModal.vue";

export default {
	components: {
		ConfirmModal
	}
};
</script>

<style>
</style>
