import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home'
import Register from '../views/Register'
import Login from '../views/Login'
import Profile from '../views/Profile'

const routes = [
    {
        path: '/',
        name: 'home',
        component: Home,
        beforeEnter: (to, from, next) => {
            if (localStorage.JwToken == null) {
                next({ path: '/login' })
            } else {
                next()
            }
        },
        meta: {
            nav: 1,
        },
    },
    {
        path: '/register',
        name: 'register',
        component: Register,
    },
    {
        path: '/login',
        name: 'login',
        component: Login,
    },
    {
        path: '/profile',
        name: 'profile',
        component: Profile,
        beforeEnter: (to, from, next) => {
            if (localStorage.JwToken == null) {
                next({ path: '/login' })
            } else {
                next()
            }
        },
        meta: {
            nav: 2,
        },
    },
]

const router = createRouter({
    history: createWebHistory(),
    routes: routes,
})

export default router
