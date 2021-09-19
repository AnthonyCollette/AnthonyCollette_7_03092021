<template>
    <div class="identity-card">
        <img :src="userAvatar" alt="Votre avatar" />
        <div class="name">{{ userName }}</div>
        <div class="email">{{ userEmail }}</div>
    </div>
</template>

<script>
export default {
    name: 'IdentityCard',
    props: {
        userAvatar: String,
        userName: String,
        userEmail: String,
    },
}
</script>

<style lang="scss" scoped>
.identity-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #f49292;
    padding: 20px;
    border-radius: 20px;
    color: white;
    width: fit-content;
    img {
        width: 200px;
    }
    .name {
        font-size: 32px;
        margin: 10px 0 0 0;
    }
}
</style>
