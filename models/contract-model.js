const { model, Schema } = require('mongoose');

const ContractSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    type: {
        type: String
    },
    startDate: {
        type: Date,
    },
    endingDate: {
        type: Date,
    },
    salary: {
        type: Number,
    },
    contractDocument: {
        type: String
    },
    canceled: {
        type: boolean,
        default: false
    }
});

module.exports = model('Contract', ContractSchema);