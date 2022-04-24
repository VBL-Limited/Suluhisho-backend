const { model, Schema } = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const OrganisationSchema = new Schema({
    denomination: {
        type: String,
        required: true
    },
	formeJuridique: {
        type: String,
        required: true
    },
	smig: {
        type: Number
    },
	taux: {
        type: Number
    },
	state:{  
        type: String,
        defualt: 'TRIAL' //- [trial, paid, ....]
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
        type: String,
        required: true
    },
    createdAt:{
        type: Date,
        default: Date.now()
    }
});

UserSchema.plugin(uniqueValidator);

module.exports = model('User', UserSchema);