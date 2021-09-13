const { Sequelize, Model, DataTypes, JSONB } = require('sequelize')
const { User } = require('../models')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const fs = require('fs')

exports.signup = async (req, res, next) => {
    const checkUser = await User.findOne({ where: { email: req.body.email } })
    if (checkUser === null) {
        bcrypt
            .hash(req.body.password, 10)
            .then(async (hash) => {
                const user = await User.create({ name: req.body.name, email: req.body.email, password: hash, avatar: `${req.protocol}://${req.get('host')}/images/${req.file.filename}` })
                return res.status(201).json()
            })
            .catch((error) => res.status(500).json({ error }))
    } else {
        throw 'Vous êtes déjà enregistré !'
    }
}

exports.login = async (req, res, next) => {
    await User.findOne({ where: { email: req.body.email } })
        .then((user) => {
            if (!user) {
                return res.status(401).json({ error: 'Utilisateur non trouvé !' })
            }
            bcrypt
                .compare(req.body.password, user.password)
                .then((valid) => {
                    if (!valid) {
                        return res.status(401).json({ error: 'Mot de passe incorrect !' })
                    }
                    return res.status(200).json({
                        token: jwt.sign({ user: user }, process.env.TOKEN_KEY, { expiresIn: '24h' }),
                    })
                })
                .catch((error) => res.status(500).json({ error }))
        })
        .catch((error) => res.status(500).json({ error }))
}

exports.getUser = async (req, res, next) => {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userId = decodedToken.user.id

    await User.findOne({ where: { id: userId } })
        .then((user) => {
            return res.status(200).json(user)
        })
        .catch((error) => res.status(500).json({ error }))
}

exports.updateOne = async (req, res, next) => {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userId = decodedToken.user.id
    const user = await User.findOne({ where: { id: userId } })
    if (req.body.password) {
        bcrypt
            .hash(req.body.password, 10)
            .then(async (hash) => {
                user.password = hash
            })
            .catch((error) => res.status(500).json({ error }))
    }
    if (req.body.name) {
        user.name = req.body.name
    }
    if (req.body.email) {
        user.email = req.body.email
    }
    if (req.file) {
        const filename = user.avatar.split('/images/')[1]
        fs.unlink(`images/${filename}`, (err) => {
            if (err) {
                console.log(error)
            } else {
                console.log('Image supprimée !')
            }
        })
        user.avatar = `${req.protocol}://${req.get('host')}/images/${req.file.filename}`
    }
    await user
        .save()
        .then(() => res.status(201).json())
        .catch((error) => res.status(500).json({ error }))
}
