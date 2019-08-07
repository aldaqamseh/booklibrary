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
							Please confirm the below is correct and Save Changes:					
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
					<p>	Title: {{newBook.title}}</p>
					<p>	Author: {{newBook.author}}</p>
					<p>	Genre: {{newBook.genre}}</p>
					<p>	Description: {{newBook.description}}</p>
					<p>	publishDate: {{newBook.publishDate}}</p>
					<p> Image Url: {{newBook.imgUrl}}</p>
					<p> ISBN: {{newBook.isbn}}</p>


					</div>
					<div class="modal-footer">
						<button
							type="button"
							class="btn btn-secondary"
							data-dismiss="modal"
						>
							Close
						</button>
						<button type="button" class="btn btn-primary" @click="submitBook">
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
	data(){
		return{
			postUrl: "http://localhost:8080/AuthenticationApplication/api/books",
			book:{
				title: this.newBook.title,
				author: this.newBook.author,
				genre: this.newBook.genre,
				description: this.newBook.description,
				publishDate: this.newBook.publishDate,
				imgUrl: this.newBook.imgUrl,
				isbn: this.newBook.isbn,
				dateAdded: "10/17/1989",
		}
		}
	},
	props:{
		newBook: Object
	},
	methods:{
		submitBook: function(){
			 this.$http.post(this.postUrl, this.book).then((response) => {
                        console.log("Form posted!")
                    }, (response) => {
                        console.log("I screwed up!")
                    });

		}
	}
};
</script>

<style>

</style>
