<template>
    <h1>{{ title }}</h1>
</template>

<script>
export default {
    name: "Heading1",
    props: {
        title: String,
    },
};
</script>

<style lang="scss" scoped>
h1 {
    margin-top: 5vw;
}
</style>
