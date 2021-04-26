import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'Apis/authentication.dart';
import 'Apis/base_response.dart';
import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pinfield="12345";
  String enteredotp;
  bool press=false;
  final TextController = TextEditingController();
  TextEditingController newTextEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final otp= TextEditingController();
  bool _value = false;
  Gradient g1 = LinearGradient(
    colors: [
      Colors.deepPurple,
      Colors.pinkAccent,
      Colors.redAccent,
      Colors.amber
    ],
  );
  dynamic res;
  Future<void> _performLogin() async {
    String email =newTextEditingController.text.trim();


    if (email.isEmpty) {
      Fluttertoast.showToast(msg: "Invalid number");
      return;
    }

    setState(() {
    });
    // Map<String, dynamic> postData = {
    //   "username": username,
    //   "password": password,
    // };
    Map<String,dynamic> data = {
      "email": email,

    };
    ResponseData responseData = await loginManager.createLoginToken(data);
    setState(() {
      res = responseData.data;

    });
    if (responseData.status == ResponseStatus.SUCCESS) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomePage(
            user: responseData.data['user'] ??
                " ",// response.data['user'] == null ? "" : response.data['user']
          ),
        ),
      );
      // Navigate forward
    } else {
      Fluttertoast.showToast(msg: responseData.message);
    }
  }
  @override
  void dispose() {
    newTextEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 150,),
                Container(
                    height: 50,
                    width: 160,
                    child: Image(image: AssetImage("img/Home icons/logo 1.png",),fit: BoxFit.cover,)),
                SizedBox(height: 120,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2 ),
                    child: TextField(
                      controller: newTextEditingController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,size: 20,),
                        hintText: "Email id",
                        hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25.0),
                      child: Container(
                        height: 20,
                        child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Colors.white,
                                backgroundColor: Colors.white
                            ),
                            child:Container(
                              width: 15,
                              height: 20,
                              child:Checkbox(
                                checkColor: Colors.redAccent,
                                value: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                },
                                activeColor: Colors.white,
                              ),
                            )
                        ),
                      ),
                    ),
                    Text("Remember me",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)
                  ],
                ),
                SizedBox(height: 100,),
                InkWell(
                  onTap: (){
                    _performLogin();
                    setState(() {
                      Fluttertoast.showToast(msg: "Otp sent Successfully");
                    });

                  },
                  child: Text("send sunil",style: TextStyle(color: Colors.white),),
                ),
                // child: Align(
                //   alignment: Alignment.center,
                //   child: Container(
                //     decoration: BoxDecoration(),
                //     width: 110,
                //     child: Text("SEND OTP",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20,),),
                //   ),
                // ),
                Align(
                    alignment: Alignment.center,
                    // child: Container(
                    //   height: 2,
                    //   width: 90,
                    //   child: a.GradientLinearProgressIndicator(
                    //     valueGradient: g1,
                    //     backgroundColor: Colors.purple[300],
                    //   ),
                    // ),
                    child: Container(
                      height: 3,
                      width: 110,
                      decoration: BoxDecoration(
                        gradient:LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.deepOrange,
                              Colors.pink,
                              Colors.purple
                              //add more colors for gradient
                            ],
                            begin: Alignment.topLeft, //begin of the gradient color
                            end: Alignment.bottomRight, //end of the gradient color
                            stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                          //set the stops number equal to numbers of color
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
