<template>
    <form id="postform" @submit="onSubmit">
        <div class="label-wrapper">
            <label>Créer un nouveau post</label>
            <textarea type="text" v-model="postText" maxlength="500" required />
            <input type="file" @change="onFileSelected" />
        </div>
        <input type="submit" value="Créer un post" />
    </form>
</template>

<script>
export default {
    name: 'PostForm',
    data() {
        return {
            postText: '',
            selectedFile: null,
        }
    },
    methods: {
        onSubmit(e) {
            e.preventDefault()
            let data = new FormData()
            data.append('postText', this.postText)

            if (this.selectedFile) {
                data.append('image', this.selectedFile, this.selectedFile.name)
            }
            this.$emit('create-post', data)

            this.postText = ''
            this.selectedFile = null
        },
        onFileSelected(event) {
            this.selectedFile = event.target.files[0]
        },
    },
}
</script>

<style lang="css" scoped>
form {
    margin-top: 50px;
    display: flex;
    flex-direction: column;
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #f49292;
    border-radius: 10px;
    padding: 15px;
    color: white;
    z-index: 999;
}

form::before {
    content: '';
    display: inline-block;
    height: 0;
    width: 0;
    border-right: 12px solid transparent;
    border-bottom: 20px solid #f49292;
    border-left: 12px solid transparent;
    position: absolute;
    top: -20px;
    left: 50px;
}

.label-wrapper {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}
label {
    color: white;
    font-size: 16px;
}
textarea {
    width: 90%;
    margin: 5px 0 10px 0;
    padding: 5px 10px;
    border: 2px solid #f49292;
    border-radius: 10px;
    resize: none;
    color: #f49292;
    font-size: 16px;
}
form > input {
    background-color: #f49292;
    padding: 10px 20px;
    border: 2px solid white;
    border-radius: 10px;
    color: white;
    font-family: 'Rubik', sans-serif;
    font-size: 1rem;
    transition: 0.4s;
    cursor: pointer;
    margin-top: 20px;
}
form > input:hover {
    background-color: white;
    color: #f49292;
}
</style>
