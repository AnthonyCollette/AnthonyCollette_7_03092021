<template>
    <main>
        <Header @new-post-added="newPostAdded" />
        <div class="container">
            <Posts :posts="posts" :userid="userid" @delete-post="deletePost" />
        </div>
        <Footer />
    </main>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import Posts from '../components/Posts.vue'
import axios from 'axios'

export default {
    name: 'Home',
    components: {
        Header,
        Footer,
        Posts,
    },
    data() {
        return {
            posts: [],
            userid: 0,
        }
    },
    methods: {
        async deletePost(id) {
            const token = 'Bearer ' + localStorage.JwToken
            const deletePost = await axios
                .delete('http://localhost:3000/api/post/delete/' + id, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then(() => {
                    this.posts = this.posts.filter((post) => post.id !== id)
                })
                .catch((error) => console.log(error))
        },
        async newPostAdded(data) {
            const token = 'Bearer ' + localStorage.JwToken
            const addPost = await axios
                .post('http://localhost:3000/api/post/create', data, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then(async (res) => {
                    this.posts = await this.fetchPosts()
                })
                .catch((error) => console.log(error))
        },
        async fetchPosts() {
            const res = await fetch(`http://localhost:3000/api/post`)
            const post = await res.json()
            return post
        },
    },
    async created() {
        this.posts = await this.fetchPosts()
        const token = 'Bearer ' + localStorage.JwToken
        await axios
            .get('http://localhost:3000/api/auth/getUser', {
                headers: {
                    Authorization: token,
                },
            })
            .then((res) => {
                this.userid = res.data.id
            })
            .catch((error) => console.log(error))
    },
}
</script>

<style lang="scss" scoped></style>
