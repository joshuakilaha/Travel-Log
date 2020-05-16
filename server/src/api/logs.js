// import LogEntries from "../../../client/Vue/src/components/LogEntries";

const { Router } =   require('express');
const router = Router();

const LogEntry =  require('../modules/modelstuct');


//POST Request
router.post('/', async function (req, res, next) {
    try{
        const logEntry = new LogEntry(req.body);
        const createdEntry = await logEntry.save();
        res.json(createdEntry);
        console.log(req.body);

    } catch (error) {
        console.error(error.name);
        if (error.name === 'VadilationError') {
            res.status(422);
        }
        next(error);
    }

});

//GET Request
router.get('/', async function (req, res) {
   try {
       const showEntries = await LogEntry.find();
       res.json(showEntries);
       console.log(req.message);
   }  catch (error) {
       next(error);
   }
});

//DELETE Request
router.delete('/:id', async function (req, res) {
    try {
        const destination = await  LogEntry.deleteOne({
            _id: req.params.id
        })
            .exec();
        res.send(destination);
    }
    catch (error) {
        res.status(500).send(error);
    }

});


//UPDATE Request
router.put('/:id', async function (req,res) {

    try {
        const destination = await LogEntry.findById(req.params.id)
            .exec();
        destination.set(req.body);
        const updatedDestination = await  destination.save();
        res.send(updatedDestination)
    }
    catch (error) {
        res.status(500).send(error);
    }
});

module.exports = router;
