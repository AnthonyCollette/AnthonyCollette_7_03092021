<template>
    <nav>
        <div class="logo-wrapper">
            <router-link to="/" tabindex="1">
                <img :src="logo.src" :alt="logo.alt" />
                <span class="society-name">Groupomania</span>
            </router-link>
        </div>
        <div class="connected-nav-wrapper" v-if="login">
            <button class="new-post" @click="toggleNewPostForm()" v-if="$route.meta.nav === 1">Créer un post</button>
            <router-link to="/" v-if="$route.meta.nav === 2">
                Home
            </router-link>
            <div class="options">
                <img class="header--avatar" :src="userAvatar" @click="toggleOptions" tabindex="0" role="button" @keyup.enter="toggleOptions" />
                <div class="options-wrapper" v-if="optionsShow">
                    <router-link class="link-profile" to="/profile">Modifier mon profil</router-link>
                    <button class="disconnect" @click="disconnect">Se déconnecter</button>
                </div>
            </div>

            <PostForm v-if="newPostForm" @create-post="newPost" />
        </div>
    </nav>
</template>

<script>
import PostForm from '../components/PostForm.vue'

export default {
    name: 'Header',
    components: {
        PostForm,
    },
    data() {
        return {
            login: false,
            newPostForm: false,
            optionsShow: false,
            avatar: '',
            logo: {
                src: require(`@/assets/icon.svg`),
                alt: 'Logo de Groupomania',
            },
        }
    },
    props: {
        postForm: Object,
        userAvatar: String,
    },
    methods: {
        disconnect() {
            localStorage.removeItem('JwToken')
            this.$router.replace({ name: 'login' })
        },
        newPost(data) {
            this.$emit('new-post-added', data)
            this.newPostForm = false
        },
        toggleLogin() {
            if (localStorage.getItem('JwToken') == null) {
                this.login = false
            } else {
                this.login = true
            }
        },
        toggleNewPostForm() {
            this.newPostForm = !this.newPostForm
        },
        toggleOptions() {
            this.optionsShow = !this.optionsShow
        },
    },
    created() {
        this.toggleLogin()
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

    .icon-options {
        font-size: 24px;
        color: #f49292;
        cursor: pointer;
    }

    .connected-nav-wrapper {
        display: flex;
        position: relative;
        align-items: center;
        a {
            color: #f49292;
            transition: 0.4s;
            &:hover {
                color: black;
            }
        }
        .disconnect {
            color: white;
            transition: 0.4s;
            cursor: pointer;
            margin-top: 10px;
            background-color: transparent;
            border: none;
            font-size: 16px;
            padding: 0;
            &:hover {
                color: black;
            }
        }
    }
    .new-post {
        margin-right: 20px;
        background-color: white;
        color: #f49292;
        border: 2px solid #f49292;
        transition: 0.4s;
        cursor: pointer;
        border-radius: 10px;
        padding: 10px;
        font-size: 16px;
    }
    .new-post:hover {
        background-color: #f49292;
        color: white;
    }

    .options {
        display: flex;
        align-items: center;
        margin-right: 30px;
        margin-left: 30px;
        i {
            margin-left: 20px;
        }
    }
    .options-wrapper {
        position: absolute;
        top: 150%;
        width: 170px;
        background-color: #f49292;
        padding: 15px;
        border-radius: 10px;
        a {
            color: white;
            margin-bottom: 10px;
            display: block;
            cursor: pointer;
            text-decoration: none;
            &:hover {
                text-decoration: none;
            }
            &:last-of-type {
                margin-bottom: 0;
            }
        }
        &::before {
            content: '';
            top: -20px;
            left: 7%;
            position: absolute;
            display: inline-block;
            height: 0;
            width: 0;
            border-right: 12px solid transparent;
            border-bottom: 20px solid #f49292;
            border-left: 12px solid transparent;
        }
    }
    .header--avatar {
        width: 50px;
        margin-right: 15px;
        cursor: pointer;
    }
}
</style>
