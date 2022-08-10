const Rupture = require('../models/rupture-model');

exports.create = async (req, res) => {
    try {
        const newRupture = new Rupture({ ...req.body });
        const saveRupture = await newRupture.save();
        return res.status(201).json(saveRupture);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findAll = async (req, res) => {
    try {
        const allRuptures = await Rupture.find();
        return res.status(200).json(allRuptures);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findOne = async (req, res) => {
    try {
        const rupture = await Rupture.findOne({ _id: req.params.id });
        if (!rupture) return res.status(404).json("Cette rupture n'existe pas !");

        return res.status(200).json(rupture);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.update = async (req, res) => {
    try {

        const updateRupture = await Rupture.findOneAndUpdate({ _id: req.params.id }, { ...req.body }, { new: true });
        if (!updateRupture) return res.status(400).json("Erreur lors de la mise à jour du rupture!");

        return res.status(201).json(updateRupture);
    } catch (error) {
        return res.status(400).json({ error });
    }
};


exports.remove = async (req, res) => {
    try {

        const removeRupture = await Rupture.findOneAndRemove({ _id: req.params.id });
        if (!removeRupture) return res.status(404).json("Cette rupture n'existe pas!");

        return res.status(200).json(removeRupture);
    } catch (error) {
        return res.status(400).json({ error });
    }
}