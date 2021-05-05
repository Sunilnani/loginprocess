import 'dart:io';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app10008/screens/home_page_screens/my_bottom_bar.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'home_page_screens/home.dart';
import 'home_page_screens/settings.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectcountry;
  final nameController = TextEditingController();
  final contact = TextEditingController();
  final country = TextEditingController();
  File img;
  File productimag ;
  void galleryClick ()  async{
    File _image;
    var galary =await ImagePicker.pickImage(source: ImageSource.gallery);
    if (galary != null){
      setState(() {
        _image=galary;
        img=galary;
        print(img.path);
      });
    }
  }
  File cameraimage;
  void cameraClick ()  async{
    File _image;
    var galary =await ImagePicker.pickImage(source: ImageSource.camera);
    if (galary != null){
      setState(() {
        _image=galary;
        img=galary;
        print(img.path);
      });
    }
  }
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

                    SizedBox(height: 30,),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                                radius: 65,
                                backgroundColor: Colors.white,
                                child: img==null?ClipOval(child: SizedBox(height:150,width: 180,child: Image.asset("img/Home icons/logo 1.png",fit: BoxFit.fill,))):ClipOval(child: SizedBox(height:150,width: 180,child: Image.file(img,fit: BoxFit.fill,)))
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
                                backgroundColor: Colors.grey[800],
                                // context and builder are
                                // required properties in this widget
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: storeItems.paddings,
                                    height: 150,
                                    color:Colors.black,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15,),
                                        Text("Profile Photo",style: storeItems.style,),
                                        SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  galleryClick();
                                                });
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: Colors.grey[900],
                                                radius: 25,
                                                child: Container(
                                                    width: 28,
                                                    child: Image.asset("img/gallery.png",fit: BoxFit.cover,)),
                                              ),
                                            ),
                                            SizedBox(width: 15,),
                                            InkWell(
                                              onTap:(){
                                                setState(() {
                                                  cameraClick();
                                                });
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: Colors.grey[900],
                                                radius: 25,
                                                child: Container(
                                                    width: 28,
                                                    child: Image.asset("img/camera.png",fit: BoxFit.cover,)),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.grey[400],
                                  child: Icon(Icons.add,color: Colors.black,),
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 100,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:storeItems.radius,
                        color: Colors.white,
                      ),

                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person,size: 18,),
                          hintText: "name",
                          hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:storeItems.radius,
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: contact,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone,size: 18,),
                          hintText: "contact",
                          hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 15),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:storeItems.radius,
                        color: Colors.white,
                      ),

                      child: FlatButton(
                        onPressed: (){
                          showCountryPicker(
                            context: context,
                            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                            exclude: <String>['KN', 'MF'],
                            //Optional. Shows phone code before the country name.
                            showPhoneCode: true,
                            // countryListTheme: CountryListThemeData(backgroundColor: Colors.grey[900],textStyle: TextStyle(color: Colors.white)),
                            onSelect: (Country country) {
                              print('Select country: ${country.displayName}');
                              setState(() {
                                selectcountry=country.name;
                              });
                            },
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_rounded,size: 18,color: Colors.grey[700],),
                              SizedBox(width: 10,),
                              if(selectcountry==null)
                                Text("Country",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey[700]))
                              else
                                Text("${selectcountry}",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey[700]),),
                            ],
                          ),
                        ),
                        // child: TextField(
                        //   controller: country,
                        //   decoration: InputDecoration(
                        //     prefixIcon: Icon(Icons.location_on_rounded,size: 18,),
                        //     hintText: "country",
                        //     hintStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 15),
                        //     border: InputBorder.none,
                        //   ),
                        // ),
                      ),
                    ),
                    SizedBox(height: 60,),
                    FlatButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      onPressed: (){
                        setState(() {
                          Fluttertoast.showToast(msg: "Profile Updated");
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>MyBottomNavigationBar(
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 75,
                            child: Text("SUBMIT",style:GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18,),),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 2,
                            width: 75,
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
                              builder: (context) => SettingsScreen(
                              ),
                            ),
                          );
                        },
                        child: Container(
                            width: 28,
                            child: Image.asset("img/arrowback.png",fit: BoxFit.cover,)),
                      ),

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
