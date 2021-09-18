<template>
    <form action="" class="update-post">
        <textarea name="update-post-text" v-model="updatedText" class="update-post--text" placeholder="Mon nouveau texte" />
        <input type="file" class="update-post--image" @change="onFileSelected" />
        <input type="button" class="update-post--button" value="Modifier" @click="updatePost(postid)" />
    </form>
</template>

<script>
export default {
    name: 'UpdatePost',
    props: {
        postid: Number,
    },
    data() {
        return {
            updatedText: '',
            selectedFile: null,
        }
    },
    methods: {
        onFileSelected(event) {
            this.selectedFile = event.target.files[0]
        },
        updatePost(postid) {
            if (!this.updatedText && !this.selectedFile) {
                return alert('Ajoutez du texte ou une image !')
            }
            let data = new FormData()
            if (this.updatedText) {
                data.append('text', this.updatedText)
            }
            if (this.selectedFile) {
                data.append('image', this.selectedFile, this.selectedFile.name)
            }
            this.updatedText = ''
            this.selectedFile = null
            this.$emit('postUpdate', postid, data)
        },
    },
}
</script>

<style lang="scss" scoped>
.update-post {
    display: flex;
    flex-direction: column;
    width: 100%;
    margin: 20px auto 0;
    align-items: center;
    border: 2px solid white;
    border-radius: 10px;
    padding: 20px 0;
    &--text {
        border-radius: 10px;
        border: none;
        padding: 15px 10px;
        font-size: 14px;
        resize: none;
        margin-bottom: 10px;
        width: 90%;
        &::placeholder {
            color: #f49292;
        }
    }

    &--button {
        background-color: #f49292;
        border-radius: 10px;
        color: white;
        font-size: 16px;
        border: 2px solid white;
        padding: 10px 20px;
        margin: 20px 0 0 0;
        transition: 0.4s;
        cursor: pointer;
        width: fit-content;
        width: -moz-fit-content;
        &:hover {
            color: #f49292;
            background-color: white;
        }
    }
}
</style>
