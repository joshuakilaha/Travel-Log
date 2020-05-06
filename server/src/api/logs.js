const { Router } =   require('express');
const router = Router();

const LogEntry =  require('../modules/modelstuct');

router.get('/', async function (req, res) {
   try {
       const showEntries = await LogEntry.find();
       res.json(showEntries);
       console.log(req.message);
   }  catch (error) {
       next(error);
   }
});

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

module.exports = router;
