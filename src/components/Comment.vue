<template>
    <div class="comment">
        <div class="comment-wrapper">
            <img :src="comment.User.avatar" alt="Avatar" />
            <p>{{ comment.User.name }}</p>
        </div>
        <div class="comment-text-wrapper" v-if="!modifyCommentForm">
            <p>{{ comment.text }}</p>
            <button class="modify-btn" @click="toggleCommentModifyForm()" v-if="comment.userid === userid || userRole === 'admin'">Modifier mon commentaire</button>
            <button class="delete-btn" @click="$emit('deleteComment', comment.id)" v-if="comment.userid === userid || userRole === 'admin'">Supprimer</button>
        </div>
        <form class="modifyCommentForm" action="" v-if="modifyCommentForm">
            <textarea v-model="modifiedComment" name="modifiedComment" placeholder="Mon nouveau commentaire..." required />
            <input type="button" @click="modifyComment(comment.id)" class="btn-send" value="Modifier mon commentaire" />
        </form>
    </div>
</template>

<script>
export default {
    name: 'Comment',
    props: {
        userid: Number,
        userRole: String,
        comment: Object,
    },
    data() {
        return {
            modifyCommentForm: false,
            modifiedComment: '',
        }
    },
    methods: {
        toggleCommentModifyForm() {
            this.modifyCommentForm = !this.modifyCommentForm
        },
        modifyComment(commentId) {
            if (this.modifiedComment == '') {
                return alert("Merci d'ajouter du texte à votre commentaire !")
            }
            let data = { text: this.modifiedComment }
            this.modifiedComment = ''
            this.modifyCommentForm = false
            this.$emit('modify-comment', data, commentId)
        },
    },
}
</script>

<style lang="scss" scoped>
.comment {
    width: 100%;
}
.modifyCommentForm {
    display: flex;
    flex-direction: column;
    width: 100%;
    textarea {
        resize: none;
        width: 100%;
        border: none;
        font-size: 16px;
        color: #f49292 !important;
        outline: none;
        &::placeholder {
            color: #f49292;
        }
    }
    .btn-send {
        background-color: #f49292;
        color: white;
        border-radius: 10px;
        border: 2px solid #f49292;
        transition: 0.4s;
        cursor: pointer;
        padding: 10px;
        &:hover {
            background-color: white;
            color: #f49292;
        }
    }
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
.modify-btn {
    font-size: 12px;
    position: absolute;
    bottom: -20px;
    right: 90px;
    color: white;
    cursor: pointer;
    background-color: transparent;
    border: none;
    padding: 0;
}
.modify-btn:hover {
    text-decoration: underline;
}
.delete-btn {
    font-size: 12px;
    position: absolute;
    bottom: -20px;
    right: 15px;
    color: white;
    cursor: pointer;
    background-color: transparent;
    border: none;
    padding: 0;
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
