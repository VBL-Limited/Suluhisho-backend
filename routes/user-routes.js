const express = require('express');
const router = express.Router();
const { login, userUpdate, signUp, settingUpdate, getUserDetails } = require('../controllers/user-controller');

router.post('/signup', signUp);
router.post('/login', login);
router.get('/details/:id', getUserDetails);
router.put('/update-details/:id', userUpdate);
router.put('/update-settings', settingUpdate);

module.exports = router;