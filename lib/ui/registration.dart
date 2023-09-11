import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../bloc/regBloc.dart';
import 'login.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}
enum SingingCharacter { Male, Female }

SingingCharacter? _character = SingingCharacter.Male;

class _SignUPState extends State<SignUP> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var cityController = TextEditingController();
  var emailIdController = TextEditingController();
  String? gender;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {

    });
  }
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
                children: [
                  SizedBox(height: 80),
                  Text(
                    'Sign Up', textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30,
                        color: Colors.white,
                        fontFamily: "fontStyle"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 20,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "fontS"),
                      ),
                    ],
                  ),
                  Container(
                    width: 290,
                    height: 44,
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        // hintText: 'USERNAME',
                        //labelText: 'USERNAME',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 20,
                      ),
                      Text(
                        'phone number',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "fontS"),
                      ),
                    ],
                  ),
                  Container(
                    width: 290,
                    height: 44,
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),

                        // hintText: 'USERNAME',
                        //labelText: 'USERNAME',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },

                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 20,
                      ),
                      Text(
                        'City',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "fontS"),
                      ),
                    ],
                  ),
                  Container(
                    width: 290,
                    height: 44,
                    child: TextFormField(
                      controller: cityController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        // hintText: 'USERNAME',
                        //labelText: 'USERNAME',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a city';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 20,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "fontS"),
                      ),
                    ],
                  ),
                  Container(
                    width: 290,
                    height: 44,
                    child: TextFormField(
                      controller: emailIdController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        // hintText: 'USERNAME',
                        //labelText: 'USERNAME',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email id';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),


                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 20,
                      ),
                      Text(
                        'password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "fontS"),
                      ),
                    ],
                  ),
                  Container(
                    width: 290,
                    height: 44,
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                          gapPadding: 4.0,
                        ),
                        // hintText: 'USERNAME',
                        //labelText: 'USERNAME',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a text';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 20,
                        ),
                        Container(
                          //height: 80,


                            child: Row(children: [
                              Text(
                                "Gender:",
                                style: TextStyle(color: Colors.white,
                                    fontSize: 15),
                              ),

                              Row(children: [
                                Radio<SingingCharacter>(
                                  activeColor: Color(0xffff0063),
                                  value: SingingCharacter.Female,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    gender = "Female";
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                                Text('Female',style: TextStyle(color: Colors.white,
                                    fontSize: 15),),
                              ]),
                              Row(children: [
                                Radio<SingingCharacter>(
                                  activeColor: Color(0xffff0063),
                                  value: SingingCharacter.Male,
                                  groupValue: _character,
                                  onChanged: (SingingCharacter? value) {
                                    gender = "Male";
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                                Text('Male',style: TextStyle(color: Colors.white,
                                    fontSize: 15),),
                              ]),
                            ])
                        ),
                      ]),


                  SizedBox(
                    height: 40,
                    width: 40,
                  ),

                  Container(
                    width: 290,
                    height: 44,
                     child:
                    // MaterialButton(
                    //   color: Color(0xffFFFFFF),
                    //   height: 10,
                    //   minWidth: MediaQuery.of(context).size.width * .36,
                    //   // minWidth:MediaQuery.of(context).size.height*.36,
                    //   onPressed: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Login()));
                    //   },
                    //   child: Text(
                    //     "Sign Up", style: TextStyle(color: Color(0XFFff0063),),
                    //   ),
                    // ),
                    MaterialButton(
                        onPressed: () =>
                        {
                          BlocProvider.of<RegBloc>(context).add(
                              CheckReg(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  gender: gender.toString(),
                                  email: emailIdController.text,
                                  city: cityController.text,
                                  password: passwordController.text,

                              )
                          )
                          // if (!_formkey.currentState!.validate())
                          //   {
                          //     Fluttertoast.showToast(
                          //         msg: '',
                          //         toastLength: Toast.LENGTH_SHORT,
                          //         gravity: ToastGravity.BOTTOM,
                          //         //timeInSecForIos: 1,
                          //         backgroundColor: Colors.white,
                          //         textColor: Colors.yellow),
                          //
                          //   }
                        },
                        height: 10,
                         minWidth: MediaQuery.of(context).size.width * .36,

                        color: Color(0xffFFFFFF),
                        child: Title(
                          color: Color(0XFFff0063),
                          child: BlocConsumer<RegBloc, RegState>(
                            builder: (context, state) {
                              if (state is CheckingReg) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text("Register", style: TextStyle(color: Color(0XFFff0063)),
                                  ));
                              }
                            },
                            listener: (context, state) {
                              if (state is RegChecked) {
                                Fluttertoast.showToast(
                                    msg: "New member added successfully");
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                              }
                              else if (state is RegError) {
                                Fluttertoast.showToast(msg: state.error);
                              }
                            },
                          ),
                        )),
                  ),

                ]),
          ),
        ),
      );
    }
  }
