<template>
    <router-view />
</template>

<script>
const axios = require('axios')

export default {
    name: 'App',
}
</script>

<style lang="scss">
* {
    font-family: 'Rubik', sans-serif;
    margin: 0;
}

a {
    text-decoration: none;
    color: black;
}

li {
    list-style: none;
}

.container {
    width: 75vw;
    margin: 0 auto;
    text-align: center;
}
</style>
