const jwt = require('jsonwebtoken')
const { Comment, User } = require('../models')

module.exports = async (req, res, next) => {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userId = decodedToken.user.id
    const commentId = req.params.id

    try {
        const user = await User.findOne({ where: { id: userId } })
        const userRole = user.dataValues.role
        const comment = await Comment.findOne({ where: { id: commentId } })
        if (comment.userid !== userId && userRole !== 'admin') {
            throw "Vous n'avez pas publié ce commentaire !"
        } else {
            next()
        }
    } catch (error) {
        console.log(error)
    }
}
