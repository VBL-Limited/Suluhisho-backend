const { model, Schema } = require('mongoose');

const ApplySchema = new Schema({
    offreId: {
        type: Schema.Types.ObjectId,
        ref: 'Offre'
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

module.exports = model('Application', ApplySchema);