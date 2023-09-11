const mongoose = require("mongoose");
const schema = mongoose.Schema;
var SchemaTypes = mongoose.Schema.Types;

const staffModelScheme=new mongoose.Schema
({
    staffId:{
        type:String
    },
    
    staff:{
        type:String
    },
    specialization:{
        typr:String
    },
    role:{
        type:String,
        default:'staff'
    }
})
module.exports = mongoose.model("staffModel", staffModelScheme);