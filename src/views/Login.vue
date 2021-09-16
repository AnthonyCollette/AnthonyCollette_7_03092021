<template>
    <main>
        <Header />
        <div class="container">
            <Heading1 title="Se connecter" />
            <LoginForm />
            <router-link to="/register" class="register-link">Pas de compte ? Crées-en un ici !</router-link>
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

<style lang="scss" scoped>
form {
    margin-bottom: 50px;
}
.register-link {
    font-size: 14px;
    color: #f49292;
}
</style>
