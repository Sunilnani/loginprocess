import 'package:flutter/material.dart';
import 'package:flutter_app10008/screens/channel_screens/premium_channels.dart';
import 'package:flutter_app10008/screens/home_page_screens/my_bottom_bar.dart';
import 'package:flutter_app10008/screens/profile_screen.dart';
import 'package:flutter_app10008/screens/transactions_screen.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: storeItems.backgroundcolors,
      body: SafeArea(
        child: Container(
          padding: storeItems.paddings,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text("Settings",style: AppColor.headingsstyles),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MyBottomNavigationBar(
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                    width: 20,
                                    child: Image.asset("img/arrowback.png",fit: BoxFit.cover,)),
                              ),
                              SizedBox(width: 15,),
                              Text("Settings",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
                            ],
                          )
                      ),
                      SizedBox(height: 3,),
                      Container(
                        height: 3,
                        width: 125,
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
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Container(
                        width: 32,
                        child: Image.asset("img/account.png",fit: BoxFit.cover,)
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Profile(
                            ),
                          ),
                        );
                      },
                      child: Container(
                          child: Text("Account",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18))),
                    )
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Container(
                        width: 23,
                        child: Image.asset("img/languages.png",fit: BoxFit.cover,)
                    ),
                    FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        onPressed: (){
                          Fluttertoast.showToast(msg: "no response");
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => SettingsScreen(
                          //     ),
                          //   ),
                          // );
                        },
                        child: Container(child: Text("Languages",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18))))
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Container(
                        width: 25,
                        child: Image.asset("img/premium.png",fit: BoxFit.cover,)
                    ),
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Premium(
                            ),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          child: Text("Premium",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18))),
                    )
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Container(
                        width: 25,
                        child: Image.asset("img/transactions.png",fit: BoxFit.cover,)
                    ),
                    FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Transactions(
                              ),
                            ),
                          );
                        },
                        child: Container(child: Text("Transactions",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18))))
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Container(
                        width: 28,
                        child: Image.asset("img/help.png",fit: BoxFit.cover,)
                    ),
                    FlatButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        onPressed: (){

                        },
                        child: Container(child: Text("Help",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18))))
                  ],
                ),
                SizedBox(height: 120,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Container(
                          height: 40,
                          width: 120,
                          child: Image(image: AssetImage("img/Home icons/logo 1.png",),fit: BoxFit.cover,)
                      ),
                      SizedBox(height: 50,),
                      Text("Privacy Policy   T&C",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(height: 20,),
                      Text("V 0.1.0",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
