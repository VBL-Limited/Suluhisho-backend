const express = require('express');
const router = express.Router();
const { login, userUpdate, signUp, settingUpdate } = require('../controllers/user-controller');

router.post('/signup', signUp);
router.post('/login', login);
router.put('/update-details', userUpdate);
router.put('/update-settings', settingUpdate);

module.exports = router;