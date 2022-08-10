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
    receivedAttestation: {
        type: Boolean,
        default: false
    },
    receivedOnem: {
        type: Boolean,
        default: false
    },
    receivedCV: {
        type: Boolean,
        default: false
    },
    receivedDiploma: {
        type: Boolean,
        default: false
    },
    salaryBase: {
        type: Number,
    },
    salaryBase: {
        type: Number,
    },
    salaryIPR: {
        type: Number,
    },
    salaryTransport: {
        type: Number,
    },
    salaryAllocationFamiliale: {
        type: Number,
    },
    salaryAmount: {
        type: Number,
    },
    canceled: { // status of the contract
        type: Boolean,
        default: false
    }
});

module.exports = model('Contract', ContractSchema);