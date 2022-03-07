const express = require('express');
const router = express.Router();

const offreCtrl = require('../controllers/offre-controller');

router.post('/', offreCtrl.create);
router.get('/', offreCtrl.getAll);
router.get('/:id', offreCtrl.getOne);
router.get('/:tag', offreCtrl.getByTag);
router.get('/:title', offreCtrl.getByTitle);
router.put('/:id', offreCtrl.update);
router.delete('/:id', offreCtrl.remove);

module.exports = router;