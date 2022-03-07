const express =  require('express');
require('dotenv').config();
const { connect } = require('mongoose');

const userRoutes = require('./routes/user-routes');
const offreRoutes = require('./routes/offre-routes');
const candidatRoutes = require('./routes/candidat-routes');
const selectionRoutes = require('./routes/selection-routes');
const applyRoutes = require('./routes/apply-routes');

const app = express();

// routes
app.use(express.json());
app.use('/api/auth', userRoutes);
app.use('/api/offre', offreRoutes);
app.use('/api/candidat', candidatRoutes);
app.use('/api/selection', selectionRoutes);
app.use('/api/apply', applyRoutes);

const port = process.env.PORT || 5000;

app.listen(port, () => {
    console.log(`Connected to port ${port}`);
    // connect to the db
    connect(process.env.DB_PATH, (err, db) => {
        if(err) throw err;
        console.log(`connected to the mongo database ${db}`);
    })
})