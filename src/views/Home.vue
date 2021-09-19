<template>
    <main>
        <Header :userAvatar="userAvatar" @new-post-added="newPostAdded" />
        <div class="container">
            <Posts @postUpdate="postUpdate" :posts="posts" :userRole="userRole" :userid="userid" @delete-post="deletePost" />
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
            userAvatar: '',
            posts: [],
            userid: 0,
            userRole: '',
        }
    },
    methods: {
        postUpdate(postid, data) {
            const token = 'Bearer ' + localStorage.JwToken
            const updatePost = axios
                .put(`http://localhost:3000/api/post/${postid}/update`, data, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then(async () => {
                    this.posts = await this.fetchPosts()
                })
                .catch((error) => console.log(error))
        },
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
            const posts = await res.json()
            return posts
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
                this.userAvatar = res.data.avatar
                this.userid = res.data.id
                this.userRole = res.data.role
            })
            .catch((error) => console.log(error))
    },
}
</script>

<style lang="scss" scoped></style>
