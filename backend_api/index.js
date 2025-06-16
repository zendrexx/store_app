//import the express module
const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
require('dotenv').config({ path: './cred.env' });
const bannerRouter= require('./routes/banner');
const categoryRouter = require('./routes/category');
const subCategoryRouter = require('./routes/sub_category');
//Define the port number
const PORT = 3000;

//Create an instance of express
//because it give us the starting point
const app = express();

//mongodb connection
const DB = process.env.DB_PASSWORD;

//middleware to register routes or to mount routes
app.use(express.json()); 
app.use(authRouter);
app.use(bannerRouter);
app.use(categoryRouter);
app.use(subCategoryRouter);

mongoose.connect(DB).then(()=>{
    console.log("Database connected successfully");
})


//start the server
app.listen(PORT,"0.0.0.0",function(){
    //LOG THE NUMBER OF THE PORT
    console.log(`Server is running on port ${PORT}`);
})