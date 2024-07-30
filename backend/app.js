const express = require('express');
const app = express();
const userModel = require('./models/user');
const psotModel = require('./models/post');
const cookieParser = require('cookie-parser');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// setting up middlewares 
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());

// logic and routes for app 
app.get('/', (req, res) => {
    res.send('Hey');
});

// creating an user
app.post('/signup', async (req, res) => {

    let { userName, email, password, age } = req.body;

    // finding if user is already in DB 
    let user = await userModel.findOne({ email });
    // sending res back if user is already registered
    if (user) return res.status(500).send("User already registered");

    // creating a user and encrypting it`s password
    bcrypt.genSalt(10, (err, salt) => {
        bcrypt.hash(password, salt, async (err, hash) => {
            let createdUser = await userModel.create({
                userName,
                email,
                password: hash,
                age
            });

            // creating token using jwt 
          let token =   jwt.sign({email:email,userId : createdUser._id},'shhhhhh');
          // setting token 
          res.cookie("token",token);
          res.send("User created");
    

        });
    });



});

// signin user
app.post('/signin',async(req,res)=>{

    let{email,password} = req.body;

    // checking if user exist or not 
   let user = await userModel.findOne({email});
   // sending response back if user is not exist 
   if(!user) return res.status(500).send('something went wrong');

   // checking if user is valid or not we use bcrypt.comapre
   bcrypt.compare(password,user.password,(err,result)=>{
    if(result){     
          // creating token using jwt 
          let token =   jwt.sign({email:email, userId :user._id},'shhhhhh');
          // setting token 
          res.cookie("token",token);

          res.status(200).send('Hurry!! you can log in ');

    }
    else res.send("Something went wrong");
   });



});

//logout user
app.get('/logout',(req,res)=>{
    res.cookie("token","");
    res.send("logout successs");
});

// profile route making it protected
app.get("/profile",isLoggedIn,(req,res)=>{
    // logging the data that we send through the isLoggedIn function
    console.log(req.user);
});

// creating a post  making it protected
app.post("/createPost",isLoggedIn,async(req,res)=>{
    // first we find who is user 
    let user = await userModel.findOne({email : req.user.email});
    let{content} = req.body;

    // creating a post
   let post = await psotModel.create({
        user : user._id, // this is for to make sure which post belong to which user
        content,
    });

    // now make sure user knows which post he has created
    user.posts.push(post._id);
   await user.save();

   res.send("Post Created successfully");
});

// fetching and showing the posts
app.get('/getPosts',isLoggedIn,async(req,res)=>{
 let user = await userModel.findOne({email : req.user.email}).populate('posts');
 res.send({"posts": user.posts});
});

// like an posts
app.get('/likePost/:id',isLoggedIn,async(req,res)=>{
    // putting users id in posts like array 
    let post = await psotModel.findOne({_id : req.params.id}).populate('user');

    if(post.likes.indexOf(req.user.userId) === -1){
        //adding user id which  add like
        post.likes.push(req.user.userId);
    }else{
        // removes user id which removes like
        post.likes.splice(post.likes.indexOf(req.user.userId),1);
    }
    await post.save();
    res.send({"likes": user.posts});
   });

   // edit the post
   app.post('/editPost/:is',async(req,res)=>{
 // first find the post 
    let post = await psotModel.findOneAndUpdate({_id : req.params.id},{content : req.body.content});
    res.send("Post updated successfully");
  });

// protected routes 
function isLoggedIn(req,res,next){
    if(req.cookies.token === "") res.send("You need to login");
    else{
       let data =  jwt.verify(req.cookies.token,'shhhhhh');
        // sending the verified user data back so we can access it thorough req.user whenever  we pass this function to make an route protected
        req.user = data;
         // this will move to next  function 
    next();
    }
   

}

app.listen(3000);
