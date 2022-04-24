const { model, Schema } = require('mongoose');

const SalarySchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    compteBancaire: {
        type: String
    },
    cnss: {
        type: Number,
    },
    logement: {
        type: Number,
    },
    transport: {
        type: Number,
    },
    salaireBase: {
        type: Number,
    },
    taxe: {
        type: Number,
    },
    total: {
        type: Number,
    }
});

module.exports = model('Salary', SalarySchema);