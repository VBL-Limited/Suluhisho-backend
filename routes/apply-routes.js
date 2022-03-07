const express = require('express');
const router = express.Router();

const applyCtrl = require('../controllers/apply-controller');

router.post('/', applyCtrl.apply);
router.get('/', applyCtrl.getAllApplications);
router.get('/:id', applyCtrl.getApplication);
router.put('/:id', applyCtrl.update);
router.delete('/:id', applyCtrl.remove);

module.exports = router;