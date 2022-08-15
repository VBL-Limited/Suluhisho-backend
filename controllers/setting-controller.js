const Setting = require('../models/setting-model');

exports.create = async (req, res) => {
    try {
        const newSetting = new Setting({ ...req.body });
        const savedSetting = await newSetting.save();
        return res.status(201).json(savedSetting);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findAll = async (req, res) => {
    try {
        const allSettings = await Setting.find();
        return res.status(200).json(allSettings);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findOne = async (req, res) => {
    try {
        const setting = await Setting.findOne({ _id: req.params.id });
        if (!setting) return res.status(404).json("Ce setting n'existe pas !");

        return res.status(200).json(setting);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.update = async (req, res) => {
    try {

        const updateSetting = await Setting.findOneAndUpdate({ _id: req.params.id }, { ...req.body }, { new: true });
        if (!updateSetting) return res.status(400).json("Erreur lors de la mise à jour du setting!");

        return res.status(201).json(updateSetting);
    } catch (error) {
        return res.status(400).json({ error });
    }
};


exports.remove = async (req, res) => {
    try {

        const removeSetting = await Setting.findOneAndRemove({ _id: req.params.id });
        if (!removeSetting) return res.status(404).json("Ce setting n'existe pas!");

        return res.status(200).json(removeSetting);
    } catch (error) {
        return res.status(400).json({ error });
    }
}