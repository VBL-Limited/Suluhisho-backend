const express = require('express');
const router = express.Router();
const userCtrl = require('../controllers/user-controller');

router.post('/signup', userCtrl.signUp);
router.post('/login', userCtrl.login);

module.exports = router;