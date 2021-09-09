<template>
    <main>
        <Header />
        <div class="container">
            <Thread />
        </div>
        <Footer />
    </main>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import Thread from '../components/Thread.vue'

export default {
    name: 'Home',
    components: {
        Header,
        Footer,
        Thread,
    },
}
</script>

<style lang="scss" scoped></style>
