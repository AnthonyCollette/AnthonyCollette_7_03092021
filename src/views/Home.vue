<template>
    <main>
        <Header />
        <div class="container">
            <Heading1 title="Fil d'actualité" />
            <PostForm />
            <Thread />
        </div>
        <Footer />
    </main>
</template>

<script>
import Header from '../components/Header.vue'
import Heading1 from '../components/Heading1.vue'
import Footer from '../components/Footer.vue'
import PostForm from '../components/PostForm.vue'
import Thread from '../components/Thread.vue'

export default {
    name: 'Home',
    components: {
        Header,
        Heading1,
        Footer,
        PostForm,
        Thread,
    },
}
</script>

<style lang="scss" scoped></style>
