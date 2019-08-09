<template>
	<div class="forum-post">
		<div class="card mb-4 px-3 pt-3">
			<div class="card-title m-0 post-title">
				<h5>{{ post.title }}</h5>
				<p>
					<i class="fas fa-user mr-1"></i>{{ post.username }}
					<span class="ml-5"
						>Date Posted:
						{{ post.date_posted.substring(0, 10) }}</span
					>
				</p>
			</div>
			<div :id="'card-body-' + post.id">
				<div class="card-body p-1">
					<hr />
					<p class="mb-0">{{ post.body }}</p>
				</div>
				<div class="card-body pt-0">
					<comments-section :postId="post.id" />
				</div>
			</div>
		</div>
	</div>
</template>

<script>
import CommentsSection from "@/components/CommentsSection.vue";
export default {
	name: "forum-post",
	props: {
		post: Object
	},
	components: {
		CommentsSection
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
</style>
