<template>
    <Header />
    <div class="modify-profile">
        <Heading1 title="Modifier mon profil" />
        <FormProfile />
    </div>
    <Footer />
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import FormProfile from '../components/FormProfile'
import Heading1 from '@/components/Heading1'

export default {
    name: 'Profile',
    components: {
        Header,
        Footer,
        FormProfile,
        Heading1,
    },
    data() {
        return {
            isHome: false,
        }
    },
}
</script>

<style lang="scss" scoped>
.modify-profile {
    display: flex;
    flex-direction: column;
    align-items: center;
}
</style>
