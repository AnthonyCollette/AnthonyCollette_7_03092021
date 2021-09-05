<template>
    <form>
        <div class="label-wrapper">
            <label for="name">Nom</label>
            <input type="text" v-model="name" required />
        </div>
        <div class="label-wrapper">
            <label for="email">Email</label>
            <input type="email" v-model="email" required />
        </div>
        <div class="label-wrapper">
            <label for="password">Mot de passe</label>
            <input type="password" v-model="password" required />
        </div>
        <div class="label-wrapper">
            <label for="avatar">Choisissez votre avatar</label>
            <input type="file" @change="onFileSelected" />
        </div>
        <input type="submit" @click="register" value="S'inscrire" />
    </form>
</template>

<script>
import axios from 'axios'

export default {
    name: 'RegisterForm',
    data() {
        return {
            name: '',
            email: '',
            password: '',
            selectedFile: null,
        }
    },
    methods: {
        onFileSelected(event) {
            this.selectedFile = event.target.files[0]
        },
        register(e) {
            e.preventDefault()
            let router = this.$router
            let data = new FormData()
            data.append('name', this.name)
            data.append('email', this.email)
            data.append('password', this.password)
            data.append('image', this.selectedFile, this.selectedFile.name)

            axios
                .post('http://localhost:3000/api/auth/signup', data)
                .then(() => router.push('/'))
                .catch((error) => console.log(error))
        },
    },
}
</script>

<style lang="scss" scoped>
form {
    margin-top: 50px;
    display: flex;
    flex-direction: column;
    align-items: center;
    .label-wrapper {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        width: 25%;
        label {
            font-size: 1rem;
        }
        input {
            width: 100%;
            margin: 5px 0 10px 0;
            padding: 5px 10px;
            border: 2px solid #f49292;
            border-radius: 10px;
        }
    }
    > input {
        background-color: #f49292;
        padding: 10px 20px;
        border: 2px solid #f49292;
        border-radius: 10px;
        color: white;
        font-family: 'Rubik', sans-serif;
        font-size: 1rem;
        transition: 0.4s;
        cursor: pointer;
        margin-top: 20px;
        &:hover {
            background-color: white;
            color: #f49292;
        }
    }
}
</style>
