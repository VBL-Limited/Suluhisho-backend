const { model, Schema } = require('mongoose');

const RuptureSchema = new Schema({
    contractId: {
        type: Schema.Types.ObjectId,
        ref: 'Contract'
    },
    message: {
        type: String
    },
    file: {
        type: String
    },
    createdAt: {
        type: Date,
        default: Date.now()
    }
});

module.exports = model('Rupture', RuptureSchema);    