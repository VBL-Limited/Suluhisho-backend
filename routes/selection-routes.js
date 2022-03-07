const express = require('express');
const router = express.Router();

const selectionCtrl = require('../controllers/selection-controller');

router.post('/', selectionCtrl.create);
router.get('/', selectionCtrl.getAll);
router.get('/:id', selectionCtrl.getOne);
router.put('/:id', selectionCtrl.update);
router.delete('/:id', selectionCtrl.remove);

module.exports = router;