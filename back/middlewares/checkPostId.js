const jwt = require('jsonwebtoken')
const { Post, User } = require('../models')

module.exports = (req, res, next) => {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userId = decodedToken.user.id
    const postId = req.params.id

    const userRole = User.findOne({ where: { id: userId } })
        .then((user) => {
            this.userRole = user.dataValues.role
        })
        .catch((error) => console.log(error))

    Post.findOne({ where: { id: postId } }).then((post) => {
        if (post.userid !== userId && this.userRole !== 'admin') {
            throw "Vous n'avez pas publié ce post !"
        } else {
            next()
        }
    })
}
