const express = require('express');
const router = express.Router();

const { create, findAll, findOne, findByTag, findByTitle, update, remove } = require('../controllers/offre-controller');

router.post('/', create);
router.get('/', findAll);
router.get('/:id', findOne);
router.get('/:tag', findByTag);
router.get('/:title', findByTitle);
router.put('/:id', update);
router.delete('/:id', remove);

module.exports = router;