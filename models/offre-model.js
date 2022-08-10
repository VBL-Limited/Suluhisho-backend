const { model, Schema } = require('mongoose');

const OffreSchema = new Schema({

    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    },
    requirements: {
        type: String,
        required: true
    },
    experience: {
        type: String
    },
    responsabilities: {
        type: String
    },
    expirationDate: {
        type: Date,
    },
    postedDate: {
        type: Date,
        required: true
    },
    location: {
        type: String
    },
    email: {
        type: String,
        required: true
    },
    mobile: {
        type: String,
        required: true
    },
    tag: {
        type: [String]
    },
    disabled: {
        type: Boolean,
        default: false
    }
});

module.exports = model('Offre', OffreSchema);