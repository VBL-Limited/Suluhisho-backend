const express = require('express');
const router = express.Router();

const candidatCtrl = require('../controllers/candidat-controller');

router.post('/', candidatCtrl.create);
router.get('/', candidatCtrl.getAll);
router.get('/:id', candidatCtrl.getOne);
router.put('/:id', candidatCtrl.update);
router.delete('/:id', candidatCtrl.remove);

module.exports = router;