<template>
    <main>
        <Header />
        <div class="container">
            <Heading1 title="S'enregistrer" />
            <RegisterForm />
        </div>
        <Footer />
    </main>
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import Heading1 from '../components/Heading1.vue'
import RegisterForm from '@/components/RegisterForm.vue'

export default {
    name: 'Register',
    components: {
        Header,
        Footer,
        Heading1,
        RegisterForm,
    },
}
</script>

<style lang="scss" scoped></style>
