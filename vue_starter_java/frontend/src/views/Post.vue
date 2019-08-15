<template>
	<div class="forum-post container mt-5">
		<a href="/forum"> < Back </a>
		<div class="card mb-4 px-3 pt-3">
			<div>
				<h2>{{ post.title }}</h2>
				<p>
					<i class="fas fa-user mr-1"></i>{{ post.user }}
					<span class="ml-5"
						>Date Posted:
						{{ post.datePosted.substring(0, 10) }}</span
					>
				</p>
			</div>
			<div>
				<div class="card-body p-1">
					<hr />
					<p class="mb-0">{{ post.body }}</p>
				</div>
				<div class="card-body pt-0">
					<div class="list-group">
						<h4 class="text-center comments-heading"> Comments </h4>
						<!-- <h4 class="text-center no-response"> No one has responded, yet... </h4> -->
						<responses-section :postId="post.id"/>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</template>

<script>
import ResponsesSection from "@/components/ResponsesSection.vue";
import auth from "../auth";


export default {
	name: "forum-post",
	components: {
		ResponsesSection
	},
	computed: {
		getComments(){
			return this.comments.length();
		}
	},
	data() {
		return {
			post: {},
			comments: [],
			user: auth.getToken(),
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/forum"
		};
	},
	props: {
		postId: String
	},
	methods: {
		fetchPostById() {
			fetch(this.API_URL + "/" + this.$route.params.postId)
				.then(response => {
					return response.json();
				})
				.then(post => {
					this.post = post;
					console.log(this.post);
				});
		}
	},
	created() {
		this.fetchPostById();
		console.log(this.$route.params.postId);
	}
};
</script>

<style>
.post-title:hover {
	cursor: pointer;
}
.post-title h5 {
	color: cornflowerblue;
}

.no-response {
	color: cornflowerblue;
}

.mr-1 {
	padding-right: 5px;
}

.comments-heading {
	color: cornflowerblue;
}

</style>
