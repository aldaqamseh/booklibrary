<template>
<div>
{{book.author}}
  </div>  
</template>

<script>
export default {
    data(){
        return{
            book: {},
            API_URL: "https://5d4c29ab00dbb1001487a5c8.mockapi.io/api/books/"
        }
    },
    props:{
        bookId: String,
    },
    methods: {
		fetchBookById() {
			fetch(this.API_URL + this.$route.params.bookId)
				.then(response => {
					return response.json();
				})
				.then(book => {
					this.book = book;
				});
		}
	},
	created() {
		this.fetchBookById();
	}
}
</script>

<style>

</style>
