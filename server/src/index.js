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
app.use(cors({
    origin: process.env.CORS_ORIGIN,
}));

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
    console.log('listening at http://localhost:${port}');
});

