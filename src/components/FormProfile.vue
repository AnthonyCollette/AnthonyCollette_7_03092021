<template>
    <form>
        <div class="input-wrapper"><label for="name">Nom</label><input type="text" v-model="name" /></div>
        <div class="input-wrapper"><label for="email">Email</label><input type="text" v-model="email" /></div>
        <div class="input-wrapper"><label for="password">Mot de passe</label><input type="password" v-model="password" /></div>
        <div class="input-wrapper"><label for="avatar">Avatar</label><input type="file" @change="onFileSelected" /></div>
        <input class="button" type="button" @click="sendNewProfile()" value="Modifier mon profil" />
    </form>
</template>

<script>
import axios from 'axios'

export default {
    name: 'FormProfile',
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
        sendNewProfile() {
            const token = 'Bearer ' + localStorage.JwToken
            let data = new FormData()
            if (this.name) {
                data.append('name', this.name)
            }
            if (this.email) {
                data.append('email', this.email)
            }
            if (this.password) {
                data.append('password', this.password)
            }
            if (this.selectedFile) {
                data.append('image', this.selectedFile, this.selectedFile.name)
            }

            axios
                .post('http://localhost:3000/api/auth/update', data, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then(() => this.$router.replace({ name: 'home' }))
                .catch((error) => console.log(error))
        },
    },
}
</script>

<style lang="scss" scoped>
form {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 20px;
}
label {
    margin-bottom: 5px;
}
.input-wrapper {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
    color: #f49292;
    width: 100%;
    input {
        border: 2px solid #f49292;
        border-radius: 10px;
        padding: 10px;
        color: #f49292;
        &:active,
        &:focus {
            outline: none;
        }
    }
}
.button {
    background-color: #f49292;
    color: white;
    border: #f49292 2px solid;
    font-size: 16px;
    border-radius: 10px;
    padding: 10px 15px;
    cursor: pointer;
    margin-top: 20px;
    transition: 0.4s;
    &:hover {
        color: #f49292;
        background-color: white;
    }
}
</style>
