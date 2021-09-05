<template>
    <div class="comments">
        <ul>
            <li v-for="(comment, index) in comments" :key="index">
                <div class="comment-wrapper">
                    <img :src="comment.User.avatar" alt="Avatar" />
                    <p>{{ comment.User.name }}</p>
                </div>
                <p>{{ comment.text }}</p>
                <a class="delete-btn" @click="deleteComment(comment.id)">Supprimer</a>
            </li>
        </ul>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'Comment',
    data() {
        return {
            comments: '',
        }
    },
    props: {
        id: Number,
    },
    methods: {
        deleteComment(commentId) {
            const token = 'Bearer ' + localStorage.JwToken
            axios
                .delete('http://localhost:3000/api/post/comment/' + commentId, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then((res) => {
                    console.log('Commentaire supprimé !')
                })
                .catch((error) => console.log(error))
        },
    },
    created() {
        axios
            .get('http://localhost:3000/api/post/' + this.id + '/comment')
            .then((res) => {
                this.comments = res.data
            })
            .catch((error) => console.log(error))
    },
}
</script>

<style scoped>
li {
    display: flex;
    background-color: white;
    border-radius: 10px;
    color: #f49292;
    padding: 15px;
    position: relative;
    width: 86%;
    margin: 20px 0 35px auto;
}

li:last-of-type {
    margin-bottom: 20px;
}

li::before {
    content: '';
    display: inline-block;
    height: 0;
    width: 0;
    border-top: 6px solid transparent;
    border-right: 10px solid white;
    border-bottom: 6px solid transparent;
    position: absolute;
    left: -10px;
    top: 20px;
}

.comment-wrapper {
    position: absolute;
    left: -80px;
    display: flex;
    flex-direction: column;
    align-items: center;
    color: white;
    top: 0;
    width: 50px;
}

.delete-btn {
    font-size: 12px;
    position: absolute;
    bottom: -20px;
    right: 15px;
    color: white;
    cursor: pointer;
}
.delete-btn:hover {
    text-decoration: underline;
}

img {
    width: 40px;
    margin-bottom: 5px;
    /* position: absolute;
    left: -70px; */
}
</style>
