<template>
    <div class="posts">
        <div v-for="(post, index) in posts" :key="index">
            <Post :post="post" :userid="userid" @delete-post="$emit('delete-post', post.id)" />
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
    },
    components: {
        Post,
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
