const express = require('express');
const router = express.Router();
const { login, userUpdate, signUp, organisationUpdate} = require('../controllers/user-controller');

router.post('/signup', signUp);
router.post('/login', login);
router.put('/update-details', userUpdate);
router.put('/update-organisation', organisationUpdate);

module.exports = router;