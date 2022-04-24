const Selection = require('../models/selection-model');

exports.create = async (req, res) => {
    try {
        const {
            applicationId,
            selectionDate,
            interviewTime,
            interviewLink,
            message,
            progress
        } = req.body;

        const newSelection = new Selection({ ...req.body} );
        const saveSelection = await newSelection.save();
        return res.status(201).json(saveSelection);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.getAll = async (req, res) => {
    try {
        const allSelections = await Selection.find();
        return res.status(200).json(allSelections);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.getOne = async (req, res) => {
    try {
        const selection = await Selection.findOne({ _id: req.params.id });
        if(!selection) return res.status(404).json("Cette selection n'existe pas !");

        return res.status(200).json(selection);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.update = async (req, res) => {
    try {
        
        const updateSelection = await Selection.findOneAndUpdate({ _id: req.params.id }, { ... req.body }, { new: true});
        if(!updateSelection) return res.status(400).json("Erreur lors de la mise à jour de la selection!");

        return res.status(201).json(updateSelection);
    } catch (error) {
        return res.status(400).json({ error });
    }
};


exports.remove = async (req, res) => {
    try {        

        const removeSelection = await Selection.findOneAndRemove({ _id: req.params.id });
        if(!removeSelection) return res.status(404).json("Cette selection n'existe pas!");

        return res.status(200).json(removeSelection);
    } catch (error) {
        return res.status(400).json({ error });
    }
}