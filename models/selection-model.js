const { model, Schema } = require('mongoose');

const SelectionSchema = new Schema({
    applicationId: {
        type: Schema.Types.ObjectId,
        ref: 'Application'
    },
    selectionDate: {
        type: Date,
        default: Date.now()
    },
    interviewTime: {
        type: String,
    },
    interviewLink: {
        type: String,
    },
    message: {
        type: String,
    },
    progress: {
        type: String,
        default: 'NONE' // test, selected, interview, declined
    }
});

module.exports = model('Selection', SelectionSchema);