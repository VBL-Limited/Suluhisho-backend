const { model, Schema } = require('mongoose');

const RuptureSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    contractId: {
        type: Schema.Types.ObjectId,
        ref: 'Contract'
    },
    cause: {
        type: String,
        required: true
    },
    textAttestation: {
        type: String,
        required: true
    },
    proofFile: {
        type: String
    },
    createdAt: {
        type: Date,
        default: Date.now()
    }
});

module.exports = model('Rupture', RuptureSchema);    