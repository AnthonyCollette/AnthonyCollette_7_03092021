const jwt = require('jsonwebtoken')
const { Post, User } = require('../models')

module.exports = async (req, res, next) => {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, process.env.TOKEN_KEY)
    const userId = decodedToken.user.id
    const postId = req.params.id

    try {
        const user = await User.findOne({ where: { id: userId } })
        const userRole = user.dataValues.role
        const post = await Post.findOne({ where: { id: postId } })
        if (post.userid !== userId && userRole !== 'admin') {
            throw "Vous n'avez pas publié ce post !"
        } else {
            next()
        }
    } catch (error) {
        console.log(error)
    }
}
