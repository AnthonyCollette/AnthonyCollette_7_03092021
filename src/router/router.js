import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home'
import Register from '../views/Register'
import Login from '../views/Login'

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
]

const router = createRouter({
    history: createWebHistory(),
    routes: routes,
})

export default router
