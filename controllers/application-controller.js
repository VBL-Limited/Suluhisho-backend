const Application = require('../models/application-model');

exports.apply = async (req, res) => {
    try {
        const newApplication = new Application({ ...req.body });
        const saveApplication = await newApplication.save();
        return res.status(201).json(saveApplication);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

exports.findAll = async (req, res) => {
    try {
        const allApplications = await Application.find();
        return res.status(200).json(allApplications);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

exports.findOne = async (req, res) => {
    try {
        const application = await Application.findOne({ _id: req.params.id });
        if (!application) return res.status(404).json("Cette application n'existe pas !");

        return res.status(200).json(application);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};

exports.update = async (req, res) => {
    try {
        const updateApplication = await Application.findOneAndUpdate({ _id: req.params.id }, { ...req.body }, { new: true });
        if (!updateApplication) return res.status(400).json("Erreur lors de la mise à jour de l'application!");

        return res.status(201).json(updateApplication);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
};


exports.remove = async (req, res) => {
    try {

        const deleteApplication = await Application.findOneAndRemove({ _id: req.params.id });
        if (!deleteApplication) return res.status(404).json("Cette application n'existe pas!");

        return res.status(200).json(deleteApplication);
    } catch (error) {
        return res.status(400).json({ error: error.message });
    }
}