const { model, Schema } = require('mongoose');

const EvaluationSchema = new Schema({
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    field: {
        type: [{
            question: String,
            answer: String
        }],
    },
    month: {
        type: String,
    },
    year: {
        type: String,
    }
});

module.exports = model('Evaluation', EvaluationSchema);