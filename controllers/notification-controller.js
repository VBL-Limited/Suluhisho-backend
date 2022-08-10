const Notification = require('../models/notification-model');

exports.create = async (req, res) => {
    try {
        const newNotification = new Notification({ ...req.body });
        const saveNotification = await newNotification.save();
        return res.status(201).json(saveNotification);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findAll = async (req, res) => {
    try {
        const allNotifications = await Notification.find();
        return res.status(200).json(allNotifications);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.findOne = async (req, res) => {
    try {
        const notification = await Notification.findOne({ _id: req.params.id });
        if (!notification) return res.status(404).json("Cette notification n'existe pas !");

        return res.status(200).json(notification);
    } catch (error) {
        return res.status(400).json({ error });
    }
};

exports.update = async (req, res) => {
    try {

        const updateNotification = await Notification.findOneAndUpdate({ _id: req.params.id }, { ...req.body }, { new: true });
        if (!updateNotification) return res.status(400).json("Erreur lors de la mise à jour du notification!");

        return res.status(201).json(updateNotification);
    } catch (error) {
        return res.status(400).json({ error });
    }
};


exports.remove = async (req, res) => {
    try {

        const removeNotification = await Notification.findOneAndRemove({ _id: req.params.id });
        if (!removeNotification) return res.status(404).json("Cette notification n'existe pas!");

        return res.status(200).json(removeNotification);
    } catch (error) {
        return res.status(400).json({ error });
    }
}