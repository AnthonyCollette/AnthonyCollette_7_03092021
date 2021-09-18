<template>
    <div class="posts">
        <div v-for="(post, index) in posts" :key="index">
            <Post @postUpdate="postUpdate" :post="post" :userid="userid" :userRole="userRole" @delete-post="$emit('delete-post', post.id)" />
        </div>
    </div>
</template>

<script>
import Post from '@/components/Post'

export default {
    name: 'Posts',
    props: {
        posts: Array,
        userid: Number,
        userRole: String,
    },
    components: {
        Post,
    },
    methods: {
        postUpdate(postid, data) {
            this.$emit('postUpdate', postid, data)
        },
    },
}
</script>

<style scoped>
.posts {
    display: flex;
    flex-direction: column-reverse;
    align-items: center;
}
</style>
