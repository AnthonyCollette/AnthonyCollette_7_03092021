<template>
    <form id="comment-form" class="comment-form">
        <textarea name="text" id="add-comment-text" v-model="comment" cols="10" rows="2" maxlength="255" placeholder="Ajouter un commentaire..." required></textarea>
        <input type="button" class="add-comment" @click="addComment(id)" value="Poster un commentaire" />
    </form>
</template>

<script>
export default {
    name: 'CommentForm',
    data() {
        return {
            comment: '',
        }
    },
    props: {
        id: Number,
        comments: Array,
    },
    methods: {
        addComment(id) {
            const token = 'Bearer ' + localStorage.JwToken
            let data = new FormData()
            data.append('comment', this.comment)
            this.$emit('addNewComment', id, data)
            this.comment = ''
        },
    },
}
</script>

<style scoped>
.post-comment {
    align-self: center;
}
.add-comment {
    background-color: #f49292;
    border-radius: 10px;
    color: white;
    font-size: 16px;
    border: 2px solid white;
    padding: 10px 20px;
    margin: 20px 0 0 0;
    transition: 0.4s;
    cursor: pointer;
    width: fit-content;
    width: -moz-fit-content;
}
.add-comment:hover {
    color: #f49292;
    background-color: white;
}

.comment-form {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
    width: 100%;
}

textarea {
    border: none;
    resize: none;
    border-radius: 10px;
    font-size: 16px;
    color: #f49292;
    padding: 10px;
    width: 97%;
}

textarea::placeholder {
    color: #f49292;
}

textarea:active,
textarea:focus {
    outline: none;
}
</style>
