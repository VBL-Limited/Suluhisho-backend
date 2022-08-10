const FileSent = require('../models/fileSent-model');

exports.create = async (req, res) => {
    try {
        const newFileSent = new FileSent({ ...req.body });
        const saveFileSent = await newFileSent.save();
        return res.status(201).json(saveFileSent);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findAll = async (req, res) => {
    try {
        const allFileSents = await FileSent.find();
        return res.status(200).json(allFileSents);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findOne = async (req, res) => {
    try {
        const fileSent = await FileSent.findOne({ _id: req.params.id });
        if (!fileSent) return res.status(404).json("Ce fileSent n'existe pas !");

        return res.status(200).json(fileSent);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.update = async (req, res) => {
    try {

        const updateFileSent = await FileSent.findOneAndUpdate({ _id: req.params.id }, { ...req.body }, { new: true });
        if (!updateFileSent) return res.status(400).json("Erreur lors de la mise à jour du fileSent!");

        return res.status(201).json(updateFileSent);
    } catch (error) {
        return res.status(400).json({ error });
    }
};


exports.remove = async (req, res) => {
    try {

        const removeFileSent = await FileSent.findOneAndRemove({ _id: req.params.id });
        if (!removeFileSent) return res.status(404).json("Ce fileSent n'existe pas!");

        return res.status(200).json(removeFileSent);
    } catch (error) {
        return res.status(400).json({ error });
    }
}