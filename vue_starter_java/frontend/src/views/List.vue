<template>
    <div class="reading-list">
		<h1>Your Reading List</h1>
			<div
				v-for="book in books"
				:key="book.id">

               <h1>{{book.title}}</h1>
               <h3> {{book.author}}</h3>
               <p>{{book.description}}</p>

			</div>
		
	</div>
</template>

<script>
export default {
    data(){
        return{
			API_URL:
                "http://localhost:8080/AuthenticationApplication/api/reading-list/",
            books: [],
}
        },
        methods:{
        fetchAllBooks() {
			fetch(this.API_URL)
				.then(response => {
					return response.json();
				})
				.then(books => {
					this.books = books;
					console.log(this.books);
                });
        }
        },
        created(){
            this.fetchAllBooks();
        }
    }

</script>

<style>

</style>
