const router=require("express").Router()
const userModel=require('../models/userModel');
const tokenModel=require('../models/tokenModel');
const serviceModel=require('../models/serviceModel');
const bookingModel=require('../models/bookingModel');
const userAuth=require('../middleware/userAuth')
const adminAuth=require('../middleware/adminAuth')
var bcrypt=require('bcryptjs');
var jwt = require('jsonwebtoken');
const slotModel=require('../models/slotModel');

//Book services
router.post('/book/services',userAuth,async(req,res)=>{
    try 
    {
        var UserId=req.user.id;
        if(UserId==null || UserId==undefined)
        {
           res.status(200).json({
               status:false,
               msg:" User Not Found"
           });
           return;
        } 
     var{serviceId,date,slot}=req.body;
     var id=req.user.id;
     console.log(id)
     if(serviceId==null || serviceId==undefined)
     {
        res.status(200).json({
            status:false,
            msg:"service id required"
        });
        return;
     }  
     if(date==null || date==undefined)
     {
        res.status(200).json({
            status:false,
            msg:"Date not provided"
        });
        return;
     } 
     if(slot==null || slot==undefined)
     {
      res.status(200).json({
          status:false,
          msg:"Select slot"
      });
      return;
     }  
     
     var task=await serviceModel.findOne({_id:serviceId})
     if(task==null || task==undefined)
     {
        res.status(200).json({
            status:false,
            msg:"Data not found"
        });
        return;
     } 
     var data=new bookingModel()
     data.UserId=req.user.id
     data.serviceId=serviceId
     data.date=date
  
     await data.save()

     var t=new slotModel()
     t.slot=slot
     t.role="slot booked"

     await t.save()

     res.status(200).json({
        status:true,
        msg:"Booking successfull",
        data:data,
        t:t
     });
     return;
    } 
    catch (error) 
    {
        console.log(error)
        res.status(500).json({
            status:false,
            msg:"Internal Server Error"
         });
         return;   
    }
})

//view booking
router.get('/viewservice/Booked',userAuth,async(req,res)=>
{
    try 
    {
        var Id=req.user.id;
        if(Id==null || Id==undefined)
        {
            res.status(200).json({
                status:false,
                msg:"userid not found"
            })
            return;  
        }
        var data=await bookingModel.find({UserId:Id,role:'booked'})
        if(data==null || data==undefined)
        {
            res.status(200).json({
                status:false, 
                msg:"data not found"
            })
            return;  
        }

        var t=await slotModel.find({UserId:Id,role:'slot booked'})
        if(t==null || t==undefined)
        {
            res.status(200).json({
                status:false, 
                msg:"data2 not found"
            })
            return;  
        }

        res.status(200).json({
            status:true,
            msg:"Services Viewed",
            data:data,
            data2:t
        })
        return;
    } 
    catch (error) 
    {
        console.log(error)
        res.status(500).json({
            status:false,
            msg:"Internal Server Error"
         });
         return;   
    }
})

//view all booked services
router.get('/view/Booked',async(req,res)=>
{
    try 
    {
        var data=await bookingModel.find({role:'booked'})
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
            msg:"Booked services Viewed",
            data:data
        })
        return;
    } 
    catch (error) 
    {
        console.log(error)
        res.status(500).json({
            status:false,
            msg:"Internal Server Error"
         });
         return;   
    }
})

//delete booking
router.post('/delete/booking',async(req,res)=>{
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
    var data=await bookingModel.findOneAndDelete({_id:id})
    if(data==null || data==undefined){
        res.status(200).json({
            status:false,
            msg:"Data not found"
        })
        return;
    }

        res.status(200).json({
            status:true,
            msg:"booking deleted",
            data:data
        })
        return;
    } 
    catch (error) 
    {
      console.log(error)
      res.status(500).json({
       status:false,
       msg:"Internal Server Error" 
      }) 
      return; 
    }
})

module.exports=router;