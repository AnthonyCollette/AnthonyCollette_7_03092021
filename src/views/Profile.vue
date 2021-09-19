<template>
    <Header :userAvatar="userAvatar" />
    <div class="modify-profile">
        <IdentityCard :userAvatar="userAvatar" :userName="userName" :userEmail="userEmail" />
        <div class="profile-wrapper">
            <Heading1 title="Modifier mon profil" />
            <FormProfile />
        </div>
    </div>
    <Footer />
</template>

<script>
import Header from '../components/Header.vue'
import Footer from '../components/Footer.vue'
import FormProfile from '../components/FormProfile'
import Heading1 from '@/components/Heading1'
import IdentityCard from '@/components/IdentityCard'
import axios from 'axios'

export default {
    name: 'Profile',
    components: {
        Header,
        Footer,
        FormProfile,
        Heading1,
        IdentityCard,
    },
    data() {
        return {
            userAvatar: '',
            userName: '',
            userEmail: '',
        }
    },
    async created() {
        const token = 'Bearer ' + localStorage.JwToken
        await axios
            .get('http://localhost:3000/api/auth/getUser', {
                headers: {
                    Authorization: token,
                },
            })
            .then((res) => {
                this.userAvatar = res.data.avatar
                this.userName = res.data.name
                this.userEmail = res.data.email
            })
            .catch((error) => console.log(error))
    },
}
</script>

<style lang="scss" scoped>
.modify-profile {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    margin-top: 100px;
}
.profile-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
}
h1 {
    margin-top: 0;
}
</style>
