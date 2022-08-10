const { model, Schema } = require("mongoose");

const OrganisationSchema = new Schema({
    denomination: {
        type: String,
    },
    formeJuridique: {
        type: String,
    },
    smig: {
        type: Number,
    },
    taux: {
        type: Number,
    },
    state: {
        type: String,
        default: "TRIAL", //- [trial, paid, ....]
    },
    duration: {
        type: Number,
        default: 14, // in days
    },
});

module.exports = model("Organisation", OrganisationSchema);
