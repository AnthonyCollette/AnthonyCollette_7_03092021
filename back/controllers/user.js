const { Sequelize, Model, DataTypes } = require('sequelize')
const { User } = require('../models')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

exports.signup = async (req, res, next) => {
    const checkUser = await User.findOne({ where: { email: req.body.email } })
    if (checkUser === null) {
        bcrypt.hash(req.body.password, 10).then(async (hash) => {
            const user = await User.create({ name: req.body.name, email: req.body.email, password: hash, avatar: `${req.protocol}://${req.get('host')}/images/${req.file.filename}` })
            return res.status(201).json()
        })
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
