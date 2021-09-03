<template>
    <form id="postform">
        <div class="label-wrapper">
            <label>Créer un nouveau post</label>
            <textarea type="text" v-model="postText" maxlength="500" required />
            <input type="file" @change="onFileSelected" />
        </div>
        <input type="submit" @click="newPost" value="Créer un post" />
    </form>
</template>

<script>
import axios from 'axios'

export default {
    name: 'PostForm',
    data() {
        return {
            postText: '',
            selectedFile: null,
        }
    },
    methods: {
        onFileSelected(event) {
            this.selectedFile = event.target.files[0]
            console.log(this.selectedFile)
        },
        newPost(e) {
            e.preventDefault()
            const token = 'Bearer ' + localStorage.getItem('JwToken')
            // const post = {
            //     postText: this.postText,
            // }
            let data = new FormData()
            data.append('postText', this.postText)
            if (this.selectedFile) {
                data.append('image', this.selectedFile, this.selectedFile.name)
            }
            axios
                .post('http://localhost:3000/api/post/create', data, {
                    headers: {
                        Authorization: token,
                    },
                })
                .then(() => (location.href = '/'))
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
        textarea {
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
