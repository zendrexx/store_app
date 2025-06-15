const express = require('express');
const User = require('../models/user');
const bcrypt = require('bcryptjs');
const authRouter = express.Router();
const jwt = require('jsonwebtoken');

authRouter.post('/api/signup',async(req,res)=>{
    try{
        const {fullName, email, password} = req.body;

        const existingEmail = await User.findOne({email});
        if(existingEmail){
            return res.status(400).json({msg: "Email already exists"});
        }else{
            // Hash the password before saving
            const salt = await bcrypt.genSalt(10);

            const hashedPassword = await bcrypt.hash(password, salt);
            var user = new User({fullName,email,password:hashedPassword});
            user = await user.save();
            res.json({user});
        }
    }catch(e){
        res.status(500).json({error:e.message});
    }
});

authRouter.post('/api/signin',async(req,res)=>{
    try{
        const {email, password} = req.body;

        const findUser = await User.findOne({email});
        if(!findUser){
            return res.status(400).json({msg: "Email do not exist"});
        }else{
            const isMatch = await bcrypt.compare(password,findUser.password);
            if(!isMatch){
                return res.status(400).json({msg: "Invalid Password"})
            }else{
               const token = jwt.sign({id:findUser._id}, "passwordKey");
               
               //remove sensitive data from the user object
               const {password, ...userWithoutPaswword} = findUser._doc;
               
                res.json({token, ...userWithoutPaswword});
            }
        }
    }catch(e){
        res.status(500).json({error:e.message});
    }
});


module.exports = authRouter;