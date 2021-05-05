import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Store {
  TextStyle style;
  Color backgroundcolors;
  BorderRadius radius;
  EdgeInsets paddings;

  Store.items({
    this.style,
    this.backgroundcolors,
    this.radius,
    this.paddings,

  });
}

Store storeItems = (
    Store.items(
      style:GoogleFonts.montserrat(color:Colors.white,fontWeight: FontWeight.w500,fontSize: 18),
      backgroundcolors: Colors.grey[900],
      radius: BorderRadius.circular(15),
      paddings: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
    )
);

class AppColor {
  static EdgeInsets padding = EdgeInsets.symmetric(horizontal: 25);
  static TextStyle headingsstyles=GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22);
}

