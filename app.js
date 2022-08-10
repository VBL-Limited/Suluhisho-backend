const express = require('express');
require('dotenv').config();
const { connect } = require('mongoose');

const app = express();

// routes
app.use(express.json());
app.use('/api/auth', require('./routes/user-routes'));
app.use('/api/offres', require('./routes/offre-routes'));
app.use('/api/applications', require('./routes/application-routes'));
app.use('/api/conges', require('./routes/conge-routes'));
app.use('/api/contract', require('./routes/contract-routes'));
app.use('/api/ruptures', require('./routes/rupture-routes'));
app.use('/api/settings', require('./routes/setting-routes'));
app.use('/api/file-sent', require('./routes/fileSent-routes'));

const port = process.env.PORT || 5000;

app.listen(port, () => {
    console.log(`Connected to port ${port}`);
    // connect to the db
    connect(process.env.DB_PATH, (err, db) => {
        if (err) throw err;
        console.log(`connected to the mongo database ${db}`);
    })
})