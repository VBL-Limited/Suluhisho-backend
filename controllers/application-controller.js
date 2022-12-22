const Application = require('../models/application-model');
const Offre = require('../models/offre-model');

exports.apply = async (req, res) => {

    const { userId, offreId } = req.body

    try {

        // Check for expiring offre
        const today = new Date().getTime()
        const hasExpiredOffre = await Offre.findById(offreId)

        if (today > hasExpiredOffre.expirationDate.getTime()) {
            return res.status(400).json({ error: "This job has expired" });
        }

        // check for the existing elements
        const existingApplication = await Application.findOne({}).where({
            userId: userId,
            offreId: offreId
        })

        if (existingApplication?.status === 'APPLIED') {
            return res.status(400).json({ error: "You have already applied for this Job" });
        }

        // if offre exists
        const existingOffre = await Offre.findOne({_id: offreId}).exec()

        if(!existingOffre){
            return res.status(404).json({ error: "This Job post doesn't exist" });
        }
        
        const newApplication = new Application({ 
            ...req.body , 
            offreId:existingOffre 
        });
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

exports.findAllByUserId = async (req, res) => {
    try {
        const allApplications = await Application.find()
            .where({ userId: req.params.id })
            .populate("offreId");
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