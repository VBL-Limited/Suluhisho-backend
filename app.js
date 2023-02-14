// const express = require("express");
// require("dotenv").config();
// const { connect } = require("mongoose");
// const morgan = require("morgan");
// const cors = require("cors");
// const app = express();
// app.use(morgan("dev"));
// const whitelist = ["http://localhost:3000"];
// const corsOptions = {
//   origin: function (origin, callback) {
//     if (!origin || whitelist.indexOf(origin) !== -1) {
//       callback(null, true);
//     } else {
//       callback(new Error("Not allowed by CORS"));
//     }
//   },
//   credentials: true,
// };
// app.use(cors(corsOptions));
// // routes
// app.use(express.json());
// // app.use("/api/auth", require("./routes/user-routes"));
// // app.use("/api/offres", require("./routes/offre-routes"));
// // app.use("/api/applications", require("./routes/application-routes"));
// // app.use("/api/conges", require("./routes/conge-routes"));
// // app.use("/api/contract", require("./routes/contract-routes"));
// // app.use("/api/settings", require("./routes/setting-routes"));
// // app.use("/api/ruptures", require("./routes/rupture-routes"));
// // app.use("/api/file-sent", require("./routes/fileSent-routes"));

// app.use("/api/test", async (req, res) => {
//   res.json(`VBL backend is working perfectly ...`);
// });

// const port = process.env.PORT || 5000;

// app.listen(port, () => {
//   console.log(`App running on port ${port}`);
//   // connect to the db
//   connect(process.env.DB_PATH, (err, db) => {
//     if (err) throw err;
//     console.log(`connected to the mongo database`);
//   });
// });
const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
require("dotenv").config();
const mongoose = require("mongoose");

const app = express();
app.use(express.json());

const UserSchema = new mongoose.Schema({
  email: { type: String, unique: true, required: true },
  password: { type: String, required: true },
  role: { type: String, required: true },
});

UserSchema.pre("save", async function (next) {
  const user = this;
  if (user.isModified("password")) {
    user.password = await bcrypt.hash(user.password, 10);
  }
  next();
});

UserSchema.methods.comparePassword = async function (password) {
  return await bcrypt.compare(password, this.password);
};

const CompanySchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String },
  jobs: [{ type: mongoose.Types.ObjectId, ref: "Job" }],
  employees: [{ type: mongoose.Types.ObjectId, ref: "Employee" }],
  admin: { type: mongoose.Types.ObjectId, ref: "User" },
});

const EmployeeSchema = new mongoose.Schema({
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  phoneNumber: { type: String, required: true },
  company: { type: mongoose.Types.ObjectId, ref: "Company" },
  salary: { type: Number, required: true },
  leaves: [{ type: mongoose.Types.ObjectId, ref: "Leave" }],
  benefits: [{ type: mongoose.Types.ObjectId, ref: "Benefit" }],
  user: { type: mongoose.Types.ObjectId, ref: "User" },
});

const JobSchema = new mongoose.Schema({
  title: { type: String, required: true },
  description: { type: String },
  company: { type: mongoose.Types.ObjectId, ref: "Company" },
  status: { type: String, required: true },
  applications: [{ type: mongoose.Types.ObjectId, ref: "JobApplication" }],
});

const JobApplicationSchema = new mongoose.Schema({
  job: { type: mongoose.Types.ObjectId, ref: "Job" },
  applicant: { type: mongoose.Types.ObjectId, ref: "Applicant" },
  resume: { type: String },
  coverLetter: { type: String },
  status: { type: String, required: true },
});

const LeaveSchema = new mongoose.Schema({
  employee: { type: mongoose.Types.ObjectId, ref: "Employee" },
  type: { type: String, required: true },
  startDate: { type: Date, required: true },
  endDate: { type: Date, required: true },
  status: { type: String, required: true },
});

const BenefitSchema = new mongoose.Schema({
  employee: { type: mongoose.Types.ObjectId, ref: "Employee" },
  type: { type: String, required: true },
  provider: { type: String, required: true },
  startDate: { type: Date, required: true },
  endDate: { type: Date, required: true },
  status: { type: String, required: true },
});

const TaskSchema = new mongoose.Schema({
  title: { type: String, required: true },
  description: { type: String },
  company: { type: mongoose.Types.ObjectId, ref: "Company" },
  employee: { type: mongoose.Types.ObjectId, ref: "Employee" },
  dueDate: { type: Date },
  status: { type: String, required: true },
});
const ApplicantSchema = new mongoose.Schema({
  firstName: { type: String, required: true },
  lastName: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  phoneNumber: { type: String },
});

const User = mongoose.model("User", UserSchema);
const Applicant = mongoose.model("Applicant", ApplicantSchema);
const Company = mongoose.model("Company", CompanySchema);
const Employee = mongoose.model("Employee", EmployeeSchema);
const Job = mongoose.model("Job", JobSchema);
const JobApplication = mongoose.model("JobApplication", JobApplicationSchema);
const Leave = mongoose.model("Leave", LeaveSchema);
const Benefit = mongoose.model("Benefit", BenefitSchema);
const Task = mongoose.model("Task", TaskSchema);
debugger;

app.post("/signup/applicant", async (req, res) => {
  try {
    // Destructure required fields from request body
    const { firstName, lastName, email, password, phoneNumber } = req.body;

    // Create new instance of Applicant model with extracted data
    const applicant = new Applicant({
      firstName,
      lastName,
      email,
      phoneNumber,
      password,
    });
    console.log("APPLICANTS", applicant);
    //Save the applicant model to the database
    await applicant.save();

    // Create new instance of User model with extracted data and associated applicant
    const user = new User({
      email,
      password,
      role: "applicant",
      applicant: applicant._id,
    });

    // Hash the password
    user.password = await bcrypt.hash(password, 10);

    // Save the user to the database
    await user.save();

    // Create and sign a JSON web token with the userId
    const token = jwt.sign({ userId: user._id }, "MY_SECRET_KEY");

    // Send the token as the response
    res.send({ token });
  } catch (error) {
    // If there is an error, send a 422 status and the error message
    return res.status(422).send(error.message);
  }
});

app.post("/signup/company", async (req, res) => {
  try {
    const { email, password } = req.body;
    const company = new Company({
      name: req.body.name,
      description: req.body.description,
    });
    const user = new User({
      email: email,
      password: password,
      role: "company_admin",
      company: company._id,
    });
    await user.save();
    await company.save();
    const token = jwt.sign({ userId: user._id }, "MY_SECRET_KEY");
    res.send({ token });
  } catch (error) {
    return res.status(422).send(error.message);
  }
});

app.post("/signup/employee", async (req, res) => {
  try {
    const { email, password } = req.body;
    const company = await Company.findById(req.body.companyId);
    if (!company) {
      throw new Error("Company not found");
    }
    const employee = new Employee({
      firstName: req.body.firstName,
      lastName: req.body.lastName,
      phoneNumber: req.body.phoneNumber,
      company: company._id,
      salary: req.body.salary,
    });
    const user = new User({
      email: email,
      password: password,
      role: "employee",
      employee: employee._id,
    });
    company.employees.push(employee._id);
    await user.save();
    await employee.save();
    await company.save();
    const token = jwt.sign({ userId: user._id }, "MY_SECRET_KEY");
    res.send({ token });
  } catch (error) {
    return res.status(422).send(error.message);
  }
});

app.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      throw new Error("User not found");
    }
    const isValid = await user.comparePassword(password);
    if (!isValid) {
      throw new Error("Invalid password");
    }
    const token = jwt.sign({ userId: user._id }, "MY_SECRET_KEY");
    res.send({ token });
  } catch (error) {
    return res.status(422).send(error.message);
  }
});

app.post("/job", async (req, res) => {
  try {
    const { title, description, companyId } = req.body;
    const company = await Company.findById(companyId);
    if (!company) {
      throw new Error("Company not found");
    }
    const job = new Job({
      title: title,
      description: description,
      company: company._id,
      status: "open",
    });
    company.jobs.push(job._id);
    await job.save();
    await company.save();
    res.send(job);
  } catch (error) {
    return res.status(422).send(error.message);
  }
});

app.post("/apply", async (req, res) => {
  try {
    const { jobId, applicantId, resume, coverLetter } = req.body;
    const job = await Job.findById(jobId);
    if (!job) {
      throw new Error("Job not found");
    }
    const applicant = await Applicant.findById(applicantId);
    if (!applicant) {
      throw new Error("Applicant not found");
    }
    const application = new JobApplication({
      job: job._id,
      applicant: applicant._id,
      resume: resume,
      coverLetter: coverLetter,
      status: "pending",
    });
    job.applications.push(application._id);
    await application.save();
    await job.save();
    res.send(application);
  } catch (error) {
    return res.status(422).send(error.message);
  }
});

app.post("/employee/leave", async (req, res) => {
  try {
    const { employeeId, type, startDate, endDate } = req.body;
    const employee = await Employee.findById(employeeId);
    if (!employee) {
      throw new Error("Employee not found");
    }
    const leave = new Leave({
      employee: employee._id,
      type: type,
      startDate: startDate,
      endDate: endDate,
      status: "pending",
    });
    employee.leaves.push(leave._id);
    await leave.save();
    await employee.save();
    res.send(leave);
  } catch (error) {
    return res.status(422).send(error.message);
  }
});

app.post("/employee/benefit", async (req, res) => {
  try {
    const { employeeId, type, provider, startDate, endDate } = req.body;
    const employee = await Employee.findById(employeeId);
    if (!employee) {
      throw new Error("Employee not found");
    }
    const benefit = new Benefit({
      employee: employee._id,
      type: type,
      provider: provider,
      startDate: startDate,
      endDate: endDate,
      status: "pending",
    });
    employee.benefits.push(benefit._id);
    await benefit.save();
    await employee.save();
    res.send(benefit);
  } catch (error) {
    return res.status(422).send(error.message);
  }
});

app.post("/employee/task", async (req, res) => {
  try {
    const { employeeId, title, description, dueDate } = req.body;
    const employee = await Employee.findById(employeeId);
    if (!employee) {
      throw new Error("Employee not found");
    }
    const company = await Company.findById(employee.company);
    if (!company) {
      throw new Error("Company not found");
    }
    const task = new Task({
      title: title,
      description: description,
      company: company._id,
      employee: employee._id,
      dueDate: dueDate,
      status: "pending",
    });
    employee.tasks.push(task._id);
    company.tasks.push(task._id);
    await task.save();
    await employee.save();
    await company.save();
    res.send(task);
  } catch (error) {
    return res.status(422).send(error.message);
  }
});
const port = process.env.PORT || 3000;
mongoose.connect(process.env.DB_PATH, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const db = mongoose.connection;

app.listen(port, () => {
  console.log(`Server started on http://localhost:${port}`);
});
db.on("error", (error) => {
  console.log("Error connecting to database: ", error);
});

db.once("open", () => {
  console.log("Connected to database!");
});
