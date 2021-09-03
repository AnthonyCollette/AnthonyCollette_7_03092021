<template>
    <section class="thread">
        <ul class="posts">
            <li class="post" v-for="(post, index) in posts" :key="index">
                {{ post.text }}
                <img :src="post.image" alt="image" v-if="post.image" />
                <span class="author"> {{ post.author }}</span>
            </li>
        </ul>
    </section>
</template>

<script>
import axios from 'axios'

export default {
    name: 'Thread',
    data() {
        return {
            posts: '',
        }
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
.posts {
    display: flex;
    flex-direction: column;
    align-items: center;
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
}

.post img {
    max-width: 100%;
    margin-top: 20px;
    border-radius: 10px;
}

.author {
    position: absolute;
    top: -40px;
    left: 20px;
    color: #f49292;
}
</style>
