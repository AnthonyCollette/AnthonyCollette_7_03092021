const express = require('express')
const router = express.Router()
const postCtrl = require('../controllers/post')
const auth = require('../middlewares/auth')
const multer = require('../middlewares/multer-config')

router.post('/create', auth, multer, postCtrl.create)
router.get('/', postCtrl.getAll)

module.exports = router
