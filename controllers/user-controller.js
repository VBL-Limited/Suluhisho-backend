const User = require('../models/user-model');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

exports.userUpdate = async (req, res) => {
    try {

        const updatedUser = await User.findOneAndUpdate(
            { _id: req.params.id },
            { ...req.body },
            { new: true }
        );
        return res.status(200).json({
            message: "User data updated successfully", updatedUser,
            success: true
        });

    } catch (error) {
        return res.status(400).json({
            message: error.message,
            success: false
        });
    }
}

exports.signUp = async (req, res) => {
    try {
        const {
            email,
            password,
            mobile,
            role,
        } = req.body;

        // crypt the password
        await bcrypt.hash(password, 16)
            .then(async (hash) => {
                // create a user
                const newUser = new User({
                    email,
                    password: hash,
                    mobile,
                    role
                });

                const saveUser = await newUser.save();

                return res.status(201).json({
                    user: saveUser,
                    token: jwt.sign(
                        { email: newUser.email },
                        'RANDOM_TOKEN_SECRET',
                        { expiresIn: '24h' }

                    ),
                    success: true
                });

            }).catch(err => res.status(500).json({
                message: err.message,
                success: false
            }));
    } catch (error) {
        return res.status(400).json({
            message: error.message,
            success: false
        });
    }
}

exports.login = async (req, res) => {

    try {
        // body
        const { email, password } = req.body;

        // find user
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(200).json({
                message: `Vos identifiants n'existent pas dans notre base de données.Veuillez réessayer`,
                success: false
            });
        }

        // compare passwords
        bcrypt.compare(password, user.password)
            .then((valid) => {

                if (!valid) {
                    return res.status(200).json({
                        message: 'Mot de passe incorrect',
                        success: false
                    });
                }

                // password is correct, return created token
                return res.status(200).json({
                    userId: user._id,
                    token: jwt.sign(
                        { userId: user._id },
                        'RANDOM_TOKEN_SECRET',
                        { expiresIn: '24h' }
                    )
                });
            }).catch(err => res.status(500).json({
                message: err.message,
                success: false
            }));

    } catch (error) {
        return res.status(401).json({
            message: error.message,
            success: false
        });
    }

}


exports.settingUpdate = async (req, res) => {

    try {
        const updateSettings = await User.findOnAndUpdate(
            { _id: req.params.id },
            { ...req.body },
            { new: true }
        );
        return res.status(200).json({
            message: "settings updated successfully", updateSettings,
            success: true
        });

    } catch (error) {
        return res.status(400).json({
            message: error.message,
            success: false
        });
    }
}