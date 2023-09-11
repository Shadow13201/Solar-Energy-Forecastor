const router=require("express").Router()
const userModel=require('../models/userModel');
const tokenModel=require('../models/tokenModel');
const staffModel =require('../models/staffModel')
const userAuth=require('../middleware/userAuth')
const adminAuth=require('../middleware/adminAuth')
var bcrypt=require('bcryptjs');
var jwt = require('jsonwebtoken');

//ADD Service
router.post('/addStaff/admin',adminAuth,async(req,res)=>{
    try 
    {
        var{staff,specialization}=req.body;
        if(staff==null || staff== undefined)
        {
            res.status(200).json({
                status:false,
                msg:'Enter staff'
            });
            return;
        }
        if(specialization==null || specialization== undefined)
        {
            res.status(200).json({
                status:false,
                msg:'Enter Specialization'
            });
            return;
        }
        var d= new staffModel({
            staff:staff,
            speacialization:specialization,
            role:'staff'
        })
        await d.save()

        res.status(200).json({
            status:true,
            msg:'Staff Added',
            data:d
        })
        return;
    } 
    catch (err) 
    {
       console.log(err);
       res.status(500).json({
        status:false,
        msg:'Internal Server Error'
       }) 
       return;
    }
})

//delete sevicce
router.post('/deletestaff/admin',adminAuth,async(req,res)=>{
    try 
    {
    var {id}=req.body;
    if(id==null || id==undefined){
        res.status(200).json({
            status:false,
            msg:"id not  provided"
        })
        return;
    }
    var data=await staffModel.findOneAndDelete({_id:id})
    if(data==null || data==undefined){
        res.status(200).json({
            status:false,
            msg:"Data not found"
        })
        return;
    }

        res.status(200).json({
            status:true,
            msg:"Staff deleted",
            data:data
        })
        return;

    } 
    catch (error) 
    {
        console.log(error);
        res.status(500).json({
         status:false,
         msg:'Internal Server Error'
        }) 
        return;  
    }
})

//View all Services
router.get('/view/staff',async(req,res)=>{
    try 
    {
        var data=await staffModel.find({role:'staff'})

        res.status(200).json({
            status:true,
            msg:"Staffs Viewed",
            data:data
        })
        return;
    } 
    catch (err) 
    {
        console.log(err);
        res.status(500).json({
         status:false,
         msg:'Internal Server Error'
        }) 
        return; 
    }
})


module.exports=router;