<template>
	<div class="list-row p-1 my-1">
		<div class="row align-items-center">
			<div class="col col-2">
				<div
					class="img-wrapper"
					v-bind:style="{
						backgroundImage: 'url(' + getImageUrl + ')'
					}"
				>
				<div
							v-if="completed"
							class="img-checked"
						>
						<img src="~@/assets/img/readcheck.png"/>
				</div>
				</div>
			</div>
			<div class="col col-7 text-left">
				<h5 class="book-title">{{ book.title }}</h5>
				<p class="book-description">{{ book.description }}</p>
			</div>
			<div class="col col-2 text-left">
				<div class="form-check" @click="updateReadingList">
					<input
						class="form-check-input"
						type="checkbox"
						v-model="completed"
						id="defaultCheck1"
					/>
					<label
						class="form-check-label mark-read"
						for="defaultCheck1"
					>
						Mark as Read
					</label>
				</div>

				<button class="btn btn-primary remove-button mt-1" @click="removeFromList">
					Remove From List
				</button>
			</div>
		</div>
	</div>
</template>

<script>
import auth from "../auth"

export default {
	data() {
		return {
			API_URL:
				"http://localhost:8080/AuthenticationApplication/api/reading-list",
		};
	},
	props: {
		book: Object,
		completed: Boolean
	},
	computed: {
		getImageUrl() {
			return '"' + this.book.imgUrl + '"';
		}
	},
	methods:{
		removeFromList(){
			fetch(this.API_URL, {
				method: "DELETE",
				mode: "cors",
				headers: {
					Accept: "application/json",
					"Content-Type": "application/json",
					Authorization: "Bearer " + auth.getToken()
				},
				body: JSON.stringify(this.book)

			})
			.then(res=>{
				console.log(res);
				this.remove();
			})
		},
		remove(){
		this.$emit('remove');
		this.removeFromList();
		},
		updateReadingList(){
			fetch(this.API_URL, {
				method: "PUT",
				mode: "cors",
				headers: {
					Accept: "application/json",
					"Content-Type": "application/json",
					Authorization: "Bearer " + auth.getToken()
				},
				body: JSON.stringify(this.book)

			})
			.then(res=>{
				console.log(res);
			})
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

.img-checked {
	width: 80px;
	height: 120px;
	text-align: left;
	background-color: hsl(220, 100%, 50%, 0.3);
}

.img-checked img{
	width: 40px;
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