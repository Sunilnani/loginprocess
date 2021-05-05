import 'package:flutter/material.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'channel_screens/premium_channels.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: storeItems.backgroundcolors,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 130,),
                    Text("Credit Card",style: storeItems.style,),
                    SizedBox(height: 30,),
                    Text("Debit Card",style: storeItems.style,),
                    SizedBox(height: 30,),
                    Text("Net Banking",style: storeItems.style,),
                    SizedBox(height: 150,),
                    Align(
                        alignment: Alignment.center,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            onPressed: (){
                              setState(() {
                                Fluttertoast.showToast(msg: "Payment Succes");
                              });
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>Premium(
                                  ),
                                ),
                              );
                            },
                            child: Container(child: Text("PAY NOW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)))
                    ),

                    SizedBox(height: 3,),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 3,
                        width: 85,
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
                      ),
                    )

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Premium(
                              ),
                            ),
                          );
                        },
                        child: Container(
                            width: 28,
                            child: Image.asset("img/arrowback.png",fit: BoxFit.cover,)),
                      ),
                      SizedBox(width: 15,),
                      Text("Payment",style: AppColor.headingsstyles),

                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
