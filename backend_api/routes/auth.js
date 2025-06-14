const express = require('express');
const User = require('../models/user');
const bcrypt = require('bcryptjs');
const authRouter = express.Router();

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

module.exports = authRouter;