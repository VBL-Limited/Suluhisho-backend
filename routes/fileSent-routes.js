const express = require('express');
const router = express.Router();
const { upload } = require('../helpers/helper');

const { create, findAll, findOne, update, remove } = require('../controllers/fileSent-controller');

router.post('/', upload.single('fichier'), create);
router.get('/', findAll);
router.get('/:id', findOne);
router.put('/:id', update);
router.delete('/:id', remove);

module.exports = router;