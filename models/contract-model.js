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
        type: boolean,
        default: false
    },
    receivedOnem: {
        type: boolean,
        default: false
    },
    receivedCV: {
        type: boolean,
        default: false
    },
    receivedDiploma: {
        type: boolean,
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
        type: boolean,
        default: false
    }
});

module.exports = model('Contract', ContractSchema);