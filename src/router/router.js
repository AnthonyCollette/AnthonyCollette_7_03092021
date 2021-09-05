import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home'
import Register from '../views/Register'
import Login from '../views/Login'
import Profile from '../views/Profile'

const routes = [
    {
        path: '/',
        component: Home,
    },
    {
        path: '/register',
        component: Register,
    },
    {
        path: '/login',
        component: Login,
    },
    {
        path: '/profile',
        component: Profile,
    },
]

const router = createRouter({
    history: createWebHistory(),
    routes: routes,
})

export default router
