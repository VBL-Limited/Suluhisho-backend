const Conge = require('../models/conge-model');

exports.create = async (req, res) => {
    try {
        const newConge = new Conge({ ...req.body });
        const saveConge = await newConge.save();
        return res.status(201).json(saveConge);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findAll = async (req, res) => {
    try {
        const allConges = await Conge.find();
        return res.status(200).json(allConges);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findOne = async (req, res) => {
    try {
        const conge = await Conge.findOne({ _id: req.params.id });
        if (!conge) return res.status(404).json("Ce conge n'existe pas !");

        return res.status(200).json(conge);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.update = async (req, res) => {
    try {

        const updateConge = await Conge.findOneAndUpdate({ _id: req.params.id }, { ...req.body }, { new: true });
        if (!updateConge) return res.status(400).json("Erreur lors de la mise à jour du conge!");

        return res.status(201).json(updateConge);
    } catch (error) {
        return res.status(400).json({ error });
    }
};


exports.remove = async (req, res) => {
    try {

        const removeConge = await Conge.findOneAndRemove({ _id: req.params.id });
        if (!removeConge) return res.status(404).json("Ce conge n'existe pas!");

        return res.status(200).json(removeConge);
    } catch (error) {
        return res.status(400).json({ error });
    }
}