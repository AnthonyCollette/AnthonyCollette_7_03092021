const jwt = require('jsonwebtoken')
const { Comment, User } = require('../models')

module.exports = (req, res, next) => {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userId = decodedToken.user.id
    const commentId = req.params.id

    const userRole = User.findOne({ where: { id: userId } })
        .then((user) => {
            this.userRole = user.dataValues.role
        })
        .catch((error) => console.log(error))

    Comment.findOne({ where: { id: commentId } }).then((comment) => {
        if (comment.userid !== userId && this.userRole !== 'admin') {
            throw "Vous n'avez pas publié ce commentaire !"
        } else {
            next()
        }
    })
}
