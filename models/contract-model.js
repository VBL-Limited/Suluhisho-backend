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
        default: 0
    },
    salaryBase: {
        type: Number,
        default: 0
    },
    salaryIPR: {
        type: Number,
        default: 0
    },
    salaryTransport: {
        type: Number,
        default: 0
    },
    salaryAllocationFamiliale: {
        type: Number,
        default: 0
    },
    salaryAmount: {
        type: Number,
        default: 0
    },
    canceled: { // status of the contract
        type: Boolean,
        default: false
    }
});

module.exports = model('Contract', ContractSchema);