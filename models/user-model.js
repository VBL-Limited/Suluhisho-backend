const { model, Schema } = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const OrganisationSchema = new Schema({
    denomination: {
        type: String,
        required: true
    },
	forme_juridique: {
        type: String,
        required: true
    },
	state:{  
        type: String,
        defualt: 'TRIAL' //- [trial, paid, ....]
    },
	duration: {
        type: Number,
        default: 0 // in days
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
    role: {
        type: String,
        defaut: 'AGENT'
    },    
    organisation: OrganisationSchema,
    ville:{
        type: String,
        required: true
    },
    adresse:{
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