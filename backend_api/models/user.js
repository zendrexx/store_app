const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    fullName:{
        type:String,
        required:true,
        trim:true,
    },

    email:{
        type:String,
        required:true,
        trim:true,
        validate:{
            validator:(value)=>{
                const result = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return result.test(value);
            },
            message: "Please enter a valid email address",
        },
    },

    state:{
        type:String,
        default: "",
    },

    city:{
        type:String,
        default: "",
    },

    locality:{
        type:String,
        default: "",
    },

    password:{
        type:String,
        required:true,
        validate:{
            validator:(value)=>{
                //check if the password is at least 8 characters long 
                return value.length >= 8;
            },
            message: "Password must be at least 8 characters long",
        },
    }
});

const User = mongoose.model('User', userSchema);
module.exports = User;
// This code defines a Mongoose schema and model for a User in a MongoDB database.
// The schema includes fields for full name, email, state, city, locality, and password.