import 'package:flutter/material.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page_screens/settings.dart';
class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  List<String> images=["img/goldmedal.png","img/silvermedal.png"];
  List<String>medaltypes=["Gold Plan","Silver plan"];
  List<String> costs=["59\$","30\$"];
  List<String> offers=["Entertainment"" + ""Sports","Entertainments"];
  List<String> validities=["Up to 3 months","upto 2 months"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: storeItems.backgroundcolors,
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                  padding: storeItems.paddings,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 70,),
                        ListView.builder(
                          itemCount: medaltypes.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index){
                            return TransactionType(
                              image: images[index],
                              cost: costs[index],
                              typemedal: medaltypes[index],
                              offer: offers[index],
                              validity: validities[index],
                            );
                          },
                        ),
                      ],
                    ),
                  )
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
                                builder: (context) => SettingsScreen(
                                ),
                              ),
                            );
                          },
                          child: Container(
                              width: 28,
                              child: Image.asset("img/arrowback.png",fit: BoxFit.cover,)),
                        ),
                        SizedBox(width: 15,),
                        Text("Transactions",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)
                      ],
                    )
                ),
              ),
            ],
          )
      ),
    );
  }
}

class TransactionType extends StatelessWidget {
  const TransactionType({
    this.image,
    this.typemedal,
    this.cost,
    this.offer,
    this.validity
  }) ;
  final String image;
  final String typemedal;
  final String cost;
  final String offer;
  final String validity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical:20),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFF707070)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(

                children: [
                  Container(width: 28,child: Image.asset(image)),
                  SizedBox(width: 15,),
                  Container(child: Text(typemedal,style: storeItems.style,)),
                  SizedBox(width: 25,),
                  Container(child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,)),
                ],
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(cost,style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600))
              ),
              SizedBox(height: 8,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(offer,style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500))
              ),
              SizedBox(height: 8,),
              Text(validity,style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500))
            ],
          ),
        ),
        SizedBox(height: 25,)
      ],
    );
  }
}
