const { model, Schema } = require("mongoose");

const NotificationSchema = new Schema({
    title: {
        type: String,
    },
    message: {
        type: String,
    },
    userId: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    }
});

module.exports = model("Notification", NotificationSchema);
