'use strict'
const { Model } = require('sequelize')
module.exports = (sequelize, DataTypes) => {
    class Comment extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Comment.belongsTo(models.User)
        }
    }
    Comment.init(
        {
            text: DataTypes.STRING,
            userid: DataTypes.INTEGER,
            postid: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'Comment',
            createdAt: false,
            updatedAt: false,
            timestamps: false,
        }
    )
    return Comment
}
