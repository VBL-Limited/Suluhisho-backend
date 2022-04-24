const { model, Schema } = require('mongoose');

const DecompteSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    contractId: {
        type: Schema.Types.ObjectId,
        ref: 'Contract'
    },
    amount: {
        type: Number
    },
    status: {
        type: String, // ON GOING or PAID
    }
});

module.exports = model('Decompte', DecompteSchema);