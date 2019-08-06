<template>
	<div class="book-row">
		<div class="row justify-content-center align-items-center mb-4">
			<div class="col col-3">
				<p class="text-center"><img :src="book.imgURL" /></p>
			</div>
			<div class="col col-9">
				<h5>{{ book.title }}</h5>
				<p>
					<span class="author"> Author: {{ book.author }} </span>
					<span class="date-published">
						{{ book.datePublished.substring(0, 10) }}</span
					>
				</p>
				<p class="description">{{ book.description }}</p>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	name: "book-row",
	props: {
		book: Object
	}
};
</script>

<style>
</style>
