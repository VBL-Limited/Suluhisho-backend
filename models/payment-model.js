const { model, Schema } = require('mongoose');

const PaymentSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    salaryAmount: {
        type: Number,
    },
    bonus: {
        type: Number,
    },
    month: {
        type: String,
    },
    year: {
        type: String,
    },
    status: {
        type: String,
    },
    paymentType: {
        type: String,
    }
});

module.exports = model('Payment', PaymentSchema);