const { model, Schema } = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const EngagementSchema = new Schema({
    OrganisationId: { type: String },
    startDate: { type: Date },
    contractTime: { type: String }, // in days
    typeContract: { type: String }, // PART-TIME or FULL-TIME
})
const CandidatSchema = new Schema({
    nom: {
        type: String,
        required: true
    },
    postnom: {
        type: String,
        required: true
    },
    prenom: {
        type: String,
        required: true
    },
    email: {
        type: String,
        unique: true,
        required: true
    },
    password: {
        type: String,
        unique: true,
        required: true
    },
    mobile: {
        type: String,
        unique: true,
        required: true
    },
    adresse: {
        type: String,
        required: true
    },
    profession: {
        type: String,
        required: true
    },
    anne_experience:{
        type: String,
        required: true
    },
    cv:{
        type: String,
    },
    resume:{
        type: String,
    },
    date_of_birth:{
        type: Date
    },
    place_of_birth:{
        type: String
    },
    nationality:{
        type: String
    },
    engagedTo: EngagementSchema
    
});

CandidatSchema.plugin(uniqueValidator);

module.exports = model('Candidat', CandidatSchema);