const express = require('express')
const router = express.Router()
const postCtrl = require('../controllers/post')
const auth = require('../middlewares/auth')
const multer = require('../middlewares/multer-config')
const checkId = require('../middlewares/checkId')

router.post('/create', auth, multer, postCtrl.create)
router.get('/', postCtrl.getAll)
router.delete('/delete/:id', auth, checkId, multer, postCtrl.delete)
router.post('/:id/comment/create', auth, multer, postCtrl.createComment)
router.get('/:id/comment', postCtrl.getComments)

module.exports = router
