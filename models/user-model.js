const { model, Schema } = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const OrganisationSchema = new Schema({
    denomination: {
        type: String
    },
	formeJuridique: {
        type: String
    },
	smig: {
        type: Number
    },
	taux: {
        type: Number
    },
	state:{  
        type: String,
        default: 'TRIAL' //- [trial, paid, ....]
    },
	duration: {
        type: Number,
        default: 14 // in days
    }
});

const UserSchema = new Schema({
    
    email:{
        type: String,
        unique: true,
        required: true
    },
    password:{
        type: String,
        required: true
    },
    mobile:{
        type: String,
        unique: true,
        required: true
    },
    nom: {
        type: String
    },
    postnom: {
        type: String
    },
    prenom: {
        type: String
    },
    gender: {
        type: String
    },
    adresse: {
        type: String
    },
    profession: {
        type: String
    },
    anne_experience:{
        type: String
    },
    cv:{
        type: String,
    },
    resume:{
        type: String,
    },
    dateOfBirth:{
        type: Date
    },
    placeOfBirth:{
        type: String
    },
    nationality:{
        type: String
    }
    ,
    role: {
        type: String,
        default: 'APPLICANT' // employee or applicant or agent
    },
    position:{
        type: String
    },
    organisation: OrganisationSchema,
    ville:{
        type: String
    },
    createdAt:{
        type: Date,
        default: Date.now()
    }
});

UserSchema.plugin(uniqueValidator);

module.exports = model('User', UserSchema);