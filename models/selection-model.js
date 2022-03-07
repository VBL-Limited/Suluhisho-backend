const { model, Schema } = require('mongoose');

const SelectionSchema = new Schema({
    offreId: {
        type: Schema.Types.ObjectId,
        ref: 'Offre'
    },
    candidatId: {
        type: Schema.Types.ObjectId,
        ref: 'Candidat'
    },
    date_limite: {
        type: Date,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    heure_fin: {
        type: String,
        required: true
    },
    interview_audio: {
        type: String,
        required: true
    },
    interview_video: {
        type: String,
        required: true
    },
    test: {
        type: String,
        required: true
    }
});

module.exports = model('Selection', SelectionSchema);