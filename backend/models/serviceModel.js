const mongoose = require("mongoose");
const schema = mongoose.Schema;
var SchemaTypes = mongoose.Schema.Types;

const serviceModelScheme=new mongoose.Schema
({
    serviceId:{
        type:String
    },
    
    service:{
        type:String
    },
    cost:{
        type:Number
    },
    role:{
        type:String,
        default:'service'
    }
})
module.exports = mongoose.model("serviceModel", serviceModelScheme);