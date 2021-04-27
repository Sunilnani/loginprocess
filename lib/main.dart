import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Apis/authentication.dart';
import 'Apis/base_response.dart';
import 'languages.dart';
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
  String enteredemails;
  bool press=false;
  final TextController = TextEditingController();
  TextEditingController newTextEditingController = TextEditingController();
  final _passwordController = TextEditingController();
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
  void getHttp() async {
    String emails =newTextEditingController.text.trim();
    // Map<String,dynamic> data = {
    //   "email": emails,
    //
    // };
    FormData formData = FormData.fromMap({
      "email": emails,
    });
    setState(() {
      enteredemails=emails;
    });
    try {
      Response response =
      await Dio().post("http://aparnamule.pythonanywhere.com/login/",data: formData);
      setState(() {
        res=response.data;
        if(response.statusCode==200){
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => HomePage(
          //       // response.data['user'] == null ? "" : response.data['user']
          //     ),
          //   ),
          // );
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
            backgroundColor: Colors.grey[800],
            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {

              // we set up a container inside which
              // we create center column and display text
              return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 350,
                  child:SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        Container(
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>LoginScreen(
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                              SizedBox(width: 20,),
                              Text("OTP Sent Successfully",style:GoogleFonts.montserrat(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w500),)
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter OTP",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w500),)),
                        SizedBox(height: 20,),
                        Center(
                          child: OTPTextField(
                            length: 4,
                            width: MediaQuery.of(context).size.width,
                            textFieldAlignment: MainAxisAlignment.spaceAround,
                            fieldWidth: 50,
                            fieldStyle: FieldStyle.underline,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.amber
                            ),
                            onChanged: (String pin) {
                              enteredotp=pin;
                            },
                            onCompleted:  (String pin) {
                              print("Completed: " + pin);
                              enteredotp=pin;
                            },
                          ),
                        ),
                        // Container(
                        //   height: 50,
                        //   child: PinCodeFields(
                        //     length: 4,
                        //     controller: newTextEditingController,
                        //     focusNode: focusNode,
                        //     onComplete: (String pin) {
                        //       // Your logic with code
                        //      enteredotp=pin;
                        //     },
                        //   ),
                        // ),
                        SizedBox(height: 50,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:35.0,vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  onPressed: (){
                                     getotp();
                                     //_performLogin();
                                    // enteredotp;
                                    // if(enteredotp==pinfield){
                                    //   Text("new");
                                    //   // Navigator.of(context).push(
                                    //   //   MaterialPageRoute(
                                    //   //     builder: (context) =>NewUser(
                                    //   //     ),
                                    //   //   ),
                                    //   // );
                                    // }else{
                                    //   Fluttertoast.showToast(msg: "wrong otp");
                                    // }
                                    setState(() {
                                      print("Pin is ${enteredotp}");
                                    });

                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text("Verify",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                                      ),
                                      SizedBox(height: 7,),
                                      Container(
                                        height: 3,
                                        width: 50,
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
                                    ],
                                  )
                              ),
                              FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                onPressed: (){
                                  setState(() {
                                    Fluttertoast.showToast(msg: "Otp resended Success fully");
                                    // Navigator.of(context).push(
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>LoginScreen(
                                    //     ),
                                    //   ),
                                    // );
                                  });
                                },
                                child: Container(
                                  child: Text("Resend",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )

              );
            },
          );
        }
        else{
          Text("error");
        }
      });
      print(response);
    } catch (e) {
      setState(() {
      });
      print(e);
    }
  }
  void getotp() async {
     String otp =_passwordController.text.trim();

    FormData formdata = FormData.fromMap({
      "otp": otp,
      "email":enteredemails
    });

    try {
      Response responses =
      await Dio().post("http://aparnamule.pythonanywhere.com/verify_otp/",data: formdata);
      setState(() {
        if(responses.statusCode==200) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  AllChannels(
                    // response.data['user'] == null ? "" : response.data['user']
                  ),
            ),
          );
        }
        else{
          Fluttertoast.showToast(msg: "Invalid password sir");
        }
      });
      print(responses);
    } catch (e) {
      setState(() {

      });
      print(e);
    }


  }
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'refresh';
    final value = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxOTU4MjQwOSwianRpIjoiY2JkNTU2ZTlhYzczNDhlNDgxOWY3YzE4NTg3MTkwMGEiLCJ1c2VyX2lkIjoiPGRqYW5nby5kYi5tb2RlbHMucXVlcnlfdXRpbHMuRGVmZXJyZWRBdHRyaWJ1dGUgb2JqZWN0IGF0IDB4N2VmY2IyNWVhMTYwPiIsInJhdyI6ImRldmVsb3BtZW50In0.yxqFDqcq2lDnFjDUoRMtzVph1QAns7QIIf8sYCh_cxA";
    prefs.setString(key, value);
  }


  Future<void> _performLogin() async {

    if (enteredotp.isEmpty) {
      Fluttertoast.showToast(msg: "Invalid password sir");
      return;
    }

    // Map<String, dynamic> postData = {
    //   "username": username,
    //   "password": password,
    // };
    Map<String,dynamic> data = {
      "otp": enteredotp,
      "email":enteredemails
    };
    ResponseData responseData = await loginManager.createLoginToken(data);
    setState(() {
      res = responseData.data;
    });
    if (responseData.status==200) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AllChannels(
           // response.data['user'] == null ? "" : response.data['user']
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

                    getHttp();
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
