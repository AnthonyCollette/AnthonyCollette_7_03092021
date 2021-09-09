<template>
    <li class="post" v-for="(post, index) in posts" :key="index">
        <i @click="deletePost(post.id)" v-if="checkPostAuthor(post.userid) === true" class="fas fa-times"></i>
        {{ post.text }}
        <img :src="post.image" alt="image" v-if="post.image" />
        <div class="author-wrapper">
            <img :src="post.User.avatar" alt="" />
            <p>{{ post.User.name }}</p>
        </div>
        <Comment :id="post.id" />
        <CommentForm :id="post.id" />
    </li>
</template>

<script>
import axios from 'axios'
import CommentForm from '@/components/CommentForm'
import Comment from '@/components/Comment'

export default {
    name: 'Post',
    data() {
        return {
            posts: '',
            userid: '',
        }
    },
    components: {
        CommentForm,
        Comment,
    },
    methods: {
        checkPostAuthor(postUserId) {
            const token = 'Bearer ' + localStorage.JwToken
            axios
                .get('http://localhost:3000/api/auth/getUser', {
                    headers: {
                        Authorization: token,
                    },
                })
                .then((res) => {
                    this.userid = res.data.id
                    console.log(postUserId + ' ' + this.userid)
                    if (postUserId === this.userid) {
                        return true
                    } else {
                        return false
                    }
                })
                .catch((error) => console.log(error))
        },
        deletePost(id) {
            const token = 'Bearer ' + localStorage.JwToken
            axios
                .delete('http://localhost:3000/api/post/delete/' + id, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then(() => {
                    this.$router.replace({ name: 'home' })
                })
                .catch((error) => console.log(error))
        },
    },
    created() {
        this.checkPostAuthor()
    },
    mounted() {
        axios
            .get('http://localhost:3000/api/post/')
            .then((res) => {
                this.posts = res.data
            })
            .catch((error) => console.log(error))
    },
}
</script>

<style scoped>
i {
    cursor: pointer;
    position: absolute;
    top: 10px;
    right: 10px;
}

.post {
    width: 600px;
    padding: 20px;
    border: 2px solid #f49292;
    background-color: #f49292;
    border-radius: 10px;
    position: relative;
    margin-top: 100px;
    color: white;
    text-align: left;
    display: flex;
    flex-direction: column;
}

.post img {
    max-width: 100%;
    margin-top: 20px;
    border-radius: 10px;
}

.author-wrapper {
    position: absolute;
    top: -65px;
    left: 20px;
    color: #f49292;
    display: flex;
    align-items: center;
}

.author-wrapper > img {
    width: 50px;
    margin-top: 0;
    margin-right: 15px;
}

.author-wrapper > p {
    font-size: 20px;
    font-weight: 600;
}
</style>
