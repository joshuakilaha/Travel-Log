const  mongoose = require('mongoose');

const { Schema } = mongoose;

const  requiredString = {
    type: String,
    required: true,
};

const requiresNumber = {
    type: Number,
    required: true,
};

const  logEntrySchema = new Schema ({

    title: requiredString,
    description: String,
    comments: String,
    image: String,
    rating: {
        type: Number,
        min: 0,
        max: 10,
        default: 0,
    },

    longitude: {
        ...requiresNumber,
        min: -180,
        max: 180
    },

    latitude: {
        ...requiresNumber,
        min: -90,
        max: 90
    },
    visitDate: {
        type: Date,
       required: true
    },
},
    {
    timestamps: true
});

const logEntry = mongoose.model('logEntry', logEntrySchema);

module.exports = logEntry;
