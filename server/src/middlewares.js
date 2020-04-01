const pageNotFound = (req, res, next) => {
    const error = new Error('Page Not Found - $ {req.orignalUrl}');
    res.status(404);
    next(error);
};

const handlingErrors = (error, req, res, next) => {
    const statusCode = res.statusCode === 200 ? 500 : res.statusCode;
    res.status(statusCode);
    res.json({
        message: error.message,
        stack: process.env.NODE_ENV === 'production' ? 'Well having an issue kilz': error.stack,
    });
};

module.exports = {
    pageNotFound,
    handlingErrors,
};
