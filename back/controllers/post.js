const { Sequelize, Model, DataTypes } = require('sequelize')
const { Post } = require('../models')
const jwt = require('jsonwebtoken')

exports.create = async (req, res, next) => {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userName = decodedToken.user.name
    if (req.file) {
        const post = await Post.create({ text: req.body.postText, author: userName, image: `${req.protocol}://${req.get('host')}/images/${req.file.filename}` })
        res.status(201).json()
    } else {
        const post = await Post.create({ text: req.body.postText, author: userName })
        res.status(201).json()
    }
}

exports.getAll = async (req, res, next) => {
    const posts = await Post.findAll().then((Post) => res.status(200).json(Post))
}
