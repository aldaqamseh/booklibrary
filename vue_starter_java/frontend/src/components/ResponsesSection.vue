<template>
	<div class="comments-section mt-4">
		<h5 class="text-center">Responses</h5>

		<div id="comments">
			<div v-for="comment in comments" :key="comment.id">
				<div class="list-group-item">
					<p class="user-name mb-0">
						<i class="fas fa-user mr-1"></i
						>{{ comment.username }}
						<span class="date ml-4">{{
							comment.datePosted.substring(0, 10)
						}}</span>
					</p>

					<p class="comment-body mb-2">{{ comment.body }}</p>
				</div>
			</div>
		</div>
		<div class="add-comment">
			<form v-on:submit.prevent class="my-2 my-lg-0">
				<input
					class="form-control mr-sm-2"
					type="text"
					placeholder="Add reply..."
					aria-label="Reply"
					v-model="newComment.body"
				/>
				<input
					type="hidden"
					value="user1"
					v-model="newComment.username"
				/>

				<button
					class="btn btn-outline-success float-right my-2 my-sm-2"
					type="submit"
					@click="addCommentByPostId"
				>
					Submit
				</button>
			</form>
		</div>
	</div>
</template>

<script>
import moment from "moment";
export default {
	props: {
		postId: String
	},
	data() {
		return {
			comments: [],
			API_URL:
				"https://5d4c29ab00dbb1001487a5c8.mockapi.io/api/posts/",
			newComment: {
				body: "",
				username: "",
				datePosted: moment().format("YYYY-MM-DD"),
				postId: this.postId
			}
		};
	},
	methods: {
		fetchCommentsByPostId() {
			fetch(this.API_URL + this.postId + "/comments")
				.then(response => {
					return response.json();
				})
				.then(comments => {
					this.comments = comments;
					console.log(this.comments);
				});
		},
		addCommentByPostId() {
			fetch(this.API_URL + this.postId + "/comments", {
				method: "POST",
				mode: "cors",
				headers: {
					Accept: "application/json",
					"Content-Type": "application/json"
				},
				body: JSON.stringify(this.newComment)
			})
				.then(res => res.json())
				.then(res => console.log(res))
				.then(this.fetchCommentsByPostId());
		}
	},
	created() {
		this.fetchCommentsByPostId();
	}
};
</script>

<style>
.user-name {
	font-size: 0.8rem;
	color: cornflowerblue;
}
.comment-body {
	font-size: 0.9rem;
}
.comments-section h5 {
	color: cornflowerblue;
	font-size: 1.2rem;
}
</style>
