const express = require('express');
const router = express.Router();

const { apply, getAllApplications, getApplication, update, remove} = require('../controllers/application-controller');

router.post('/', apply);
router.get('/', getAllApplications);
router.get('/:id', getApplication);
router.put('/:id', update);
router.delete('/:id', remove);

module.exports = router;