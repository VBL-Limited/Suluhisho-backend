const multer = require('multer');

// storage
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        return cb(null, 'uploads');
    },
    filename: (req, file, cb) => {
        return cb(null, `${file.fieldname}_${Date.now()}_${file.originalname}`);
    }
});

// filter
const fileFilter = (req, file, cb) => {
    if(file.mimetype === 'image/png' || file.mimetype === 'image/jpeg'){
         return cb(null, true);
    }else{
        return cb(null, false);
    }
}

// upload
const upload = multer({
    storage: storage,
    fileFilter: fileFilter
});

module.exports = { upload };