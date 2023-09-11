const mongoose = require("mongoose");
const schema = mongoose.Schema;
var SchemaTypes = mongoose.Schema.Types;

const slotModelScheme=new mongoose.Schema
({
    UserId:{
        type:mongoose.Schema.Types.ObjectId,ref:"userModel"
    },
    slotId:{
        type:String
    },
    
    slot:{
        type:String
    },
    role:{
        type:String,
        default:"slot"
    }
})
module.exports = mongoose.model("slotModel", slotModelScheme);