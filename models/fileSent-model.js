const { model, Schema } = require('mongoose');

const FileSentSchema = new Schema({

    file: {
        type: String,
        required: true
    },
    userId: { // admin
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    agentId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    }
});

module.exports = model('file-sent', FileSentSchema);