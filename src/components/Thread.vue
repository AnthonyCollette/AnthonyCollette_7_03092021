<template>
    <section class="thread">
        <ul class="posts">
            <Post />
        </ul>
    </section>
</template>

<script>
import Post from '@/components/Post'

export default {
    name: 'Thread',
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
