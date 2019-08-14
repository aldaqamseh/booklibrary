<template>
	<div class="list-row p-1 my-1">
		<div class="row align-items-center">
			<div class="col col-2">
				<div
					class="img-wrapper"
					v-bind:style="{
						backgroundImage: 'url(' + getImageUrl + ')'
					}"
				></div>
			</div>
			<div class="col col-7 text-left">
				<h5 class="book-title">{{ book.title }}</h5>
				<p class="book-description">{{ book.description }}</p>
			</div>
			<div class="col col-2 text-left">
				<div class="form-check">
					<input
						class="form-check-input"
						type="checkbox"
						value=""
						id="defaultCheck1"
					/>
					<label
						class="form-check-label mark-read"
						for="defaultCheck1"
					>
						Mark as Read
					</label>
				</div>
				<button class="btn btn-primary remove-button mt-1">
					Remove From List
				</button>
			</div>
		</div>
	</div>
</template>

<script>
export default {
	props: {
		book: Object
	},
	computed: {
		getImageUrl() {
			return '"' + this.book.imgUrl + '"';
		}
	}
};
</script>

<style>
.list-row {
	border-bottom: 1px solid darkgray;
}
.img-wrapper {
	width: 80px;
	height: 120px;
	background-size: contain;
	background-position: center center;
	background-repeat: no-repeat;
	margin: auto;
}
.book-title {
	font-size: 1rem;
}
.book-description {
	font-size: 0.7rem;
}
.mark-read {
	font-size: 0.8rem;
}
.remove-button.btn {
	font-size: 0.7rem;
}
</style>