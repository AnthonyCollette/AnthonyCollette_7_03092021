const { Sequelize, Model, DataTypes } = require('sequelize')
const { Post, User, Comment } = require('../models')
const jwt = require('jsonwebtoken')
const fs = require('fs')

exports.create = async (req, res, next) => {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userId = decodedToken.user.id
    if (req.file) {
        const post = await Post.create({ text: req.body.postText, userid: userId, image: `${req.protocol}://${req.get('host')}/images/${req.file.filename}` })
        res.status(201).json()
    } else {
        const post = await Post.create({ text: req.body.postText, userid: userId })
        res.status(201).json()
    }
}

exports.update = async (req, res, next) => {
    const id = req.params.id
    const post = await Post.findOne({ where: { id: id } })
    console.log(post)
    if (req.body.text) {
        post.text = req.body.text
    }
    if (req.file) {
        const filename = post.image.split('/images/')[1]
        fs.unlink(`images/${filename}`, (err) => {
            if (err) {
                console.log(err)
            } else {
                console.log('Image supprimée !')
            }
        })
        post.image = `${req.protocol}://${req.get('host')}/images/${req.file.filename}`
    }
    await post
        .save()
        .then(() => res.status(201).json())
        .catch((error) => res.status(500).json({ error }))
}

exports.getAll = async (req, res, next) => {
    const posts = await Post.findAll({
        include: User,
    }).then((Post) => {
        res.status(200).json(Post)
    })
}

exports.delete = async (req, res, next) => {
    const id = req.params.id
    const findPost = await Post.findOne({ where: { id: id } })
        .then(async (post) => {
            if (post.image == null) {
                const deletePost = await Post.destroy({ where: { id: id } })
                res.status(201).json()
            } else {
                const filename = post.image.split('/images/')[1]
                fs.unlink(`images/${filename}`, () => {
                    Post.destroy({ where: { id: id } })
                        .then(() => res.status(201).json({ message: 'Post supprimé !' }))
                        .catch((error) => res.status(400).json({ error }))
                })
            }
        })
        .catch((error) => res.status(500).json({ error }))
}

exports.createComment = async (req, res, next) => {
    const postId = req.params.id
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userId = decodedToken.user.id
    const createComment = await Comment.create({ text: req.body.comment, userid: userId, postid: postId })
        .then(() => res.status(201).json())
        .catch((error) => res.status(400).json({ error }))
}

exports.getComments = async (req, res, next) => {
    const postId = req.params.id
    const comments = await Comment.findAll({
        where: { postid: postId },
        include: User,
    }).then((Comment) => {
        res.status(200).json(Comment)
    })
}

exports.deleteComment = async (req, res, next) => {
    const id = req.params.id
    const deleteComment = await Comment.destroy({ where: { id: id } }).then(() => res.status(201).json())
}

exports.modifyComment = async (req, res, next) => {
    const id = req.params.id
    const comment = await Comment.findOne({ where: { id: id } })
    comment.text = req.body.text
    await comment
        .save()
        .then(() => res.status(201).json())
        .catch((error) => res.status(500).json({ error }))
}
