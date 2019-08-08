<template>
	<div class="modal-wrapper">
		<div
			class="modal fade"
			tabindex="-1"
			role="dialog"
			id="confirmModal"
			aria-labelledby="confirm-modal-label"
			aria-hidden="true"
		>
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="confirm-modal-label">
							Please confirm the below is correct and Save
							Changes:
						</h5>
						<button
							type="button"
							class="close"
							data-dismiss="modal"
							aria-label="Close"
						>
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>Title: {{ book.title }}</p>
						<p>Author: {{ book.author }}</p>
						<p>Genre: {{ book.genre }}</p>
						<p>Description: {{ book.description }}</p>
						<p>
							Publish Date:
							{{ book.publishDate }}
						</p>
						<p>Image Url: {{ book.imgUrl }}</p>
						<p>ISBN: {{ book.isbn }}</p>
					</div>
					<div class="modal-footer">
						<button
							type="button"
							class="btn btn-secondary"
							data-dismiss="modal"
						>
							Close
						</button>
						<button
							type="button"
							class="btn btn-primary"
							@click="submitBook"
							data-dismiss="modal"
						>
							Save changes
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	props: {
		newBook: Object
	},
	data() {
		return {
			postUrl:
				"http://localhost:8080/AuthenticationApplication/api/books",
			book: this.newBook
		};
	},

	methods: {
		submitBook() {
			console.log(JSON.stringify(this.book));
			fetch(this.postUrl, {
				method: "POST",
				mode: "cors",
				headers: {
					Accept: "application/json",
					"Content-Type": "application/json"
				},
				body: JSON.stringify(this.book)
			})
				.then(res => res.json())
				.then(res => console.log(res));
		}
	}
};
</script>

<style>
</style>
