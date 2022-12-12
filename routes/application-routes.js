const express = require('express');
const router = express.Router();

const { apply, findAll, findOne, update, remove, findAllByUserId } = require('../controllers/application-controller');

router.post('/', apply);
router.get('/', findAll);
router.get('/:id', findOne);
router.get('/user/:id', findAllByUserId)
router.put('/:id', update);
router.delete('/:id', remove);

module.exports = router;