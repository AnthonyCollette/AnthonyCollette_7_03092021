<template>
    <main>
        <Header />
        <div class="container">
            <Heading1 title="Se connecter" />
            <LoginForm />
        </div>
        <Footer />
    </main>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import Heading1 from '../components/Heading1.vue'
import LoginForm from '@/components/LoginForm.vue'

export default {
    name: 'Register',
    components: {
        Header,
        Footer,
        Heading1,
        LoginForm,
    },
}
</script>

<style lang="scss" scoped></style>
