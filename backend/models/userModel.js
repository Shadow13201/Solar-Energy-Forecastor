const mongoose = require("mongoose");
const schema = mongoose.Schema;
var SchemaTypes = mongoose.Schema.Types;


const userModelSchema = new mongoose.Schema({
    name: {
        type: String
    },
    email: {
        type: String,
        required:true
    },
    phonenumber: {
        type: Number
       
    },
    gender:{
        type:String
    },
    city: {
        type: String
    },
    password:{
        type:String
    },
    role: {
        type: String,
        default:'User' 
    }, //Admin
    status: {
        type:String,
        default:"Active"
    }
});

module.exports = mongoose.model("userModel", userModelSchema);