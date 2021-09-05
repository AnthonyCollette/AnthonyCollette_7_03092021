const express = require('express')
const router = express.Router()
const userCtrl = require('../controllers/user')
const multer = require('../middlewares/multer-config')
const auth = require('../middlewares/auth')

router.post('/signup', multer, userCtrl.signup)
router.post('/login', userCtrl.login)
router.get('/getUser', userCtrl.getUser)

module.exports = router
