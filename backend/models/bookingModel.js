const mongoose = require("mongoose");
const schema = mongoose.Schema;
var SchemaTypes = mongoose.Schema.Types;


const bookingModelSchema = new mongoose.Schema({
    UserId:{
        type:mongoose.Schema.Types.ObjectId,ref:"userModel"
    },

    serviceId:{
        type: mongoose.Schema.Types.ObjectId,ref:"serviceModel"
    },
    bookingId:{
        type:String
    },
    date:{
        //type:Date
        type:String
    },
    role:{
        type:String,
        default:"booked"
    }
});
module.exports = mongoose.model("bookingModel", bookingModelSchema);