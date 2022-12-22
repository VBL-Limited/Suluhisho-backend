const express = require("express");
require("dotenv").config();
const { connect } = require("mongoose");
const morgan = require("morgan");
var cors = require("cors");

const app = express();
app.use(morgan("dev"));
app.use(cors());
// routes
app.use(express.json());
app.use("/api/auth", require("./routes/user-routes"));
app.use("/api/user", require("./routes/user-routes"));
app.use("/api/offres", require("./routes/offre-routes"));
app.use("/api/notifications", require("./routes/notification-routes"));
app.use("/api/applications", require("./routes/application-routes"));
app.use("/api/conges", require("./routes/conge-routes"));
app.use("/api/contract", require("./routes/contract-routes"));
app.use("/api/settings", require("./routes/setting-routes"));
app.use("/api/ruptures", require("./routes/rupture-routes"));
app.use("/api/file-sent", require("./routes/fileSent-routes"));

app.use("/api/test", async (req, res) => {
  res.json(`VBL backend is working perfectly ...`);
});

const port = process.env.PORT || 7777;

app.listen(port, () => {
  console.log(`App running on port ${port}`);
  // connect to the db
  connect(process.env.DB_PATH, (err, db) => {
    if (err) throw err;
    console.log(`connected to the mongo database`);
  });
});
