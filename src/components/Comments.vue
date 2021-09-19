<template>
    <div class="comments">
        <ul>
            <li v-for="(comment, index) in comments" :key="index">
                <Comment :comment="comment" :userid="userid" :userRole="userRole" @deleteComment="deleteComment" @modify-comment="modifyComment" />
            </li>
        </ul>
    </div>
</template>

<script>
import Comment from '@/components/Comment'

export default {
    name: 'Comments',
    components: {
        Comment,
    },
    props: {
        comments: Array,
        userid: Number,
        userRole: String,
    },
    methods: {
        deleteComment(commentId) {
            this.$emit('deleteComment', commentId)
        },
        modifyComment(data, commentId) {
            this.$emit('modifyComment', data, commentId)
        },
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
