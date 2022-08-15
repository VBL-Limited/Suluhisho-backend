const express = require('express');
const router = express.Router();

const { apply, findAll, findOne, update, remove } = require('../controllers/application-controller');

router.post('/', apply);
router.get('/', findAll);
router.get('/:id', findOne);
router.put('/:id', update);
router.delete('/:id', remove);

module.exports = router;