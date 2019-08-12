import Vue from 'vue'
import Router from 'vue-router'
import auth from './auth'
import Home from './views/Home.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import Books from './views/Books.vue'
import Admin from './views/Admin.vue'
import Forum from './views/Forum.vue'
import Post from './views/Post.vue'
import Book from './views/Book.vue'
import List from './views/List.vue'

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */


const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/books",
      name: "books",
      component: Books,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/admin",
      name: "admin",
      component: Admin,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/forum",
      name: "forum",
      component: Forum,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/list",
      name: "list",
      component: List,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/forum/:postId",
      name: "post",
      component: Post,
      props: true,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/books/:bookId",
      name: "book",
      component: Book,
      props: true,
      meta: {
        requiresAuth: false
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);
  const user = auth.getUser();

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && !user) {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
