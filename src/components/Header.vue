<template>
    <nav>
        <div class="logo-wrapper">
            <a href="/">
                <img :src="logo.src" :alt="logo.alt" />
                <span class="society-name">Groupomania</span>
            </a>
        </div>

        <button class="nav-items disconnect" @click="disconnect" v-if="login">Se déconnecter</button>

        <ul class="nav-items" v-else>
            <li v-for="item in navItems" :key="item">
                <a :href="item.url">{{ item.name }}</a>
            </li>
        </ul>
    </nav>
</template>

<script>
import axios from 'axios'

export default {
    name: 'Header',
    data() {
        return {
            login: false,
            navItems: [
                {
                    name: 'Home',
                    url: '/',
                },
                {
                    name: 'Se connecter',
                    url: '/login',
                },
                {
                    name: "S'inscrire",
                    url: '/register',
                },
            ],
            logo: {
                src: require(`@/assets/icon.svg`),
                alt: 'Logo de Groupomania',
            },
        }
    },
    methods: {
        disconnect() {
            localStorage.removeItem('JwToken')
            location.href = '/login'
        },
    },
    computed: {
        toggleLogin() {
            if (localStorage.getItem('JwToken') == null) {
                this.login = false
            } else {
                this.login = true
            }
        },
    },
}
</script>

<style lang="scss" scoped>
nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 5px 5px rgba($color: #000000, $alpha: 0.2);
    padding: 0 12.5vw;

    .logo-wrapper {
        a {
            display: flex;
            align-items: center;
            .society-name {
                font-size: 2vw;
                color: #f49292;
                font-weight: 600;
            }
            img {
                width: 5vw;
            }
        }
    }

    .nav-items {
        display: flex;
        li {
            position: relative;
            margin-left: 2vw;
            &:hover {
                color: white;
            }
            &::before {
                content: '';
                position: absolute;
                width: 100%;
                height: 10%;
                background-color: #f49292;
                bottom: -10%;
                z-index: -1;
            }
        }
    }

    .disconnect {
        color: white;
        background-color: #f49292;
        border: 2px solid #f49292;
        cursor: pointer;
        padding: 10px 20px;
        border-radius: 10px;
        font-size: 16px;
        transition: 0.4s;
        &:hover {
            color: #f49292;
            background-color: white;
        }
    }
}
</style>
