const Contract = require('../models/contract-model');

exports.create = async (req, res) => {
    try {

        const newContract = new Contract({ ...req.body });
        const saveContract = await newContract.save();
        return res.status(201).json(saveContract);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findAll = async (req, res) => {
    try {
        const allContracts = await Contract.find();
        return res.status(200).json(allContracts);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findOne = async (req, res) => {
    try {
        const contract = await Contract.findOne({ _id: req.params.id });
        if (!contract) return res.status(404).json("Ce contract n'existe pas !");

        return res.status(200).json(contract);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.update = async (req, res) => {
    try {

        const updateContract = await Contract.findOneAndUpdate({ _id: req.params.id }, { ...req.body }, { new: true });
        if (!updateContract) return res.status(400).json("Erreur lors de la mise à jour du contract!");

        return res.status(201).json(updateContract);
    } catch (error) {
        return res.status(400).json({ error });
    }
};


exports.remove = async (req, res) => {
    try {

        const removeContract = await Contract.findOneAndRemove({ _id: req.params.id });
        if (!removeContract) return res.status(404).json("Ce contract n'existe pas!");

        return res.status(200).json(removeContract);
    } catch (error) {
        return res.status(400).json({ error });
    }
}