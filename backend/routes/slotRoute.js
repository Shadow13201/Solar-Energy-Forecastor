const router=require("express").Router()
const userModel=require('../models/userModel');
const tokenModel=require('../models/tokenModel');
const serviceModel=require('../models/serviceModel');
const bookingModel=require('../models/bookingModel');
const slotModel=require('../models/slotModel')
const userAuth=require('../middleware/userAuth')
const adminAuth=require('../middleware/adminAuth')
var bcrypt=require('bcryptjs');
var jwt = require('jsonwebtoken');

router.post('/time/slot',adminAuth,async(req,res)=>{
    try 
    {
       var{slot}=req.body;
       if(slot==null || slot==undefined)
       {
        res.status(200).json({
            status:false,
            msg:"Select slot"
        });
        return;
       } 
       var assign=new slotModel({
       slot:slot,
       role:'slot'
    })

       await assign.save()

       res.status(200).json({
        status:true,
        msg:"Slot selected",
        data:assign
       });
       return;
    } 
    catch (err) 
    {
      console.log(err)
      res.status(500).json({
        status:false,
        msg:"Internal Server Error"
      });
      return;
    }
})


//view slots
router.get('/view/slots',async(req,res)=>{
    try 
    {
     var data = await slotModel.find({role:'slot'})  
     if(data==null || data==undefined)
        {
            res.status(200).json({
                status:false,
                msg:"data not found"
            })
            return;  
        }
        res.status(200).json({
            status:true,
            msg:"Slots viewed",
            data:data
        })
        return;
    }  
    catch (err) 
    {
        console.log(err)
        res.status(500).json({
            status:false,
            msg:"Internal Server Error"
         });
         return;   
    }
})




module.exports=router;