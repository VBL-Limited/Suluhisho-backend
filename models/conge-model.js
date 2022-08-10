const { model, Schema } = require('mongoose');

const CongeSchema = new Schema({
    type: {
        type: String,
        required: true
    },
    reason: {
        type: String,
        required: true
    },
    dateBegin: {
        type: Date
    },
    dateEnd: {
        type: Date
    },
    status: {
        type: String,
        default: 'PENDING'
    },
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    createdAt: {
        type: Date,
        default: Date.now()
    }
});

module.exports = model('Conge', CongeSchema);    