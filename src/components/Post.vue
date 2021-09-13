<template>
    <div class="post">
        <i @click="$emit('deletePost', post.id)" class="fas fa-times" v-if="post.userid === userid"></i>

        {{ post.text }}
        <img :src="post.image" alt="image" v-if="post.image" />
        <div class="author-wrapper">
            <img :src="post.User.avatar" alt="" />
            <p>{{ post.User.name }}</p>
        </div>
        <Comment :id="post.id" :userid="userid" :comments="comments" @deleteComment="deleteComment" />
        <CommentForm :id="post.id" :comments="comments" @addNewComment="newCommentAdded" />
    </div>
</template>

<script>
import CommentForm from '@/components/CommentForm'
import Comment from '@/components/Comment'
import axios from 'axios'

export default {
    name: 'Post',
    components: {
        CommentForm,
        Comment,
    },
    props: {
        post: Object,
        userid: Number,
    },
    data() {
        return {
            comments: [],
            id: this.post.id,
        }
    },
    methods: {
        checkPostAuthor() {
            const token = 'Bearer ' + localStorage.JwToken
            axios
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
        async deleteComment(commentId) {
            const token = 'Bearer ' + localStorage.JwToken
            const deleteComment = await axios
                .delete('http://localhost:3000/api/post/comment/' + commentId, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then(() => {
                    this.comments = this.comments.filter((comment) => comment.id !== commentId)
                })
                .catch((error) => console.log(error))
        },
        async newCommentAdded(id, data) {
            const token = 'Bearer ' + localStorage.JwToken
            const addComment = await axios
                .post(`http://localhost:3000/api/post/${id}/comment/create`, data, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then(async () => {
                    this.comments = await this.fetchComments()
                })
                .catch((error) => console.log(error))
        },
        async fetchComments() {
            const res = await fetch(`http://localhost:3000/api/post/${this.post.id}/comment`)
            const comment = await res.json()
            return comment
        },
    },
    async created() {
        this.comments = await this.fetchComments()
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
