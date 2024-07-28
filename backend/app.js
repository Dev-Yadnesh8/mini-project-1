const express = require('express');
const app = express();
const userModel = require('./models/user');
const cookieParser = require('cookie-parser');

// setting up middlewares 
app.use(express.json());
app.use(express.urlencoded({extended : true}));
app.use(cookieParser());

// logic and routes for app 
app.get('/',(req,res)=>{
    res.send('Hey');
});

app.listen(3000);
