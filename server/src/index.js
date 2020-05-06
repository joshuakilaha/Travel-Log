const express  = require('express');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');
const mongoose = require('mongoose');

require('dotenv').config();
const middlware = require('./middlewares');
const logs = require('./api/logs');

const app = express();


mongoose.connect(process.env.DATABASE_URL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

app.use(morgan('common'));
app.use(helmet());
// app.use(cors({
//     origin: process.env.CORS_ORIGIN,
// }));


// PREVENTING CORS (security mechanism for the browser) ERRORS
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept, Authorization"
    );
    if (req.method === "OPTIONS") {
        res.header("Access-Control-Allow-Methods", "PUT, POST, PATCH, DELETE, GET");
        return res.status(200).json({});
    }
    next();
});

//interpreting  the request body
app.use(express.json());

app.use('/api/logs', logs);
app.get('/', (req,res) => {
    res.json({
        message: 'Welcome to my journal'
    });
});

app.use(middlware.pageNotFound);
app.use(middlware.handlingErrors);


const  port = process.env.PORT || 1337;
app.listen(port, () => {
    console.log(`listening at http://localhost:${port}`);
});

