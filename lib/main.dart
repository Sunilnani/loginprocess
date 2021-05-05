import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as a;

import 'login_page.dart';

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
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  Gradient g1 = LinearGradient(
    colors: [
      Colors.deepPurple,
      Colors.pinkAccent,
      Colors.redAccent,
      Colors.amber
    ],
  );
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:storeItems.backgroundcolors,
      body: SafeArea(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      height: 70,
                      width: 220,
                      child: Image(image: AssetImage("img/Home icons/logo 1.png",),fit: BoxFit.cover,)),
                ),
                SizedBox(height: 50,),
                a.GradientCircularProgressIndicator(
                  valueGradient: g1,
                  backgroundColor: Colors.grey[200],
                ),

                // Container(
                //   height: 50,
                //   width: 50,
                //   child: Image.asset("img/Home icons/Ellipse 1.png",fit: BoxFit.cover,),
                // ),

              ]
          ),
        ),
      ),
    );
  }
}
