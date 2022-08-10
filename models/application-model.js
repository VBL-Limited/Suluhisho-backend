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
    status: {
        type: String,
        default: 'NONE' // // test, selected, interview, declined
    },
    interviewTime: {
        type: String,
    },
    interviewLink: {
        type: String,
    },
    response: {
        type: String
    },
    createdAt: {
        type: Date,
        default: Date.now()
    }
});

module.exports = model('Application', ApplySchema);