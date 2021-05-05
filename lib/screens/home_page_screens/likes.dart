import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/channels.dart';
import '../channel_screens/channel.dart';
import '../../network_calls/base_network.dart';
class LikesScreen extends StatefulWidget {
  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  bool _fetching=false;
  List<String> moviecolors=["img/channels/favourites1.png","img/channels/favourites2.png","img/channels/favourites3.png","img/channels/favourites1.png","img/channels/favourites2.png",];
  Videochannel videos= Videochannel();
  void getfav() async {

    setState(() {
      _fetching = true;
    });
    try {
      SharedPreferences prefs= await SharedPreferences.getInstance();
      String token = prefs.get("token");
      Response response = await dioClient.ref.get("http://aparnamule.pythonanywhere.com/add_remove_favorites/?channel_id=1",
          options: Options(
              validateStatus: (status) => status < 500,
              headers: {
                "Authorization":"Bearer $token"
              }
          )
      );


      setState(() {
        videos = videochannelFromJson(jsonEncode(response.data));
        _fetching = false;
      });
      print(response);
    } catch (e) {
      setState(() {
        _fetching = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getfav();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: storeItems.backgroundcolors,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 90,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Horror Movies",style: TextStyle(color: Colors.white),)),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount:moviecolors.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return HorrorMovies(
                              colors: moviecolors[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Comedy Movies",style:TextStyle(color: Colors.white),)),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount: moviecolors.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return ComedyMovies(
                              colors: moviecolors[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Romantic Movies",style: TextStyle(color: Colors.white),)),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount: moviecolors.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return RomanticMovies(
                              colors: moviecolors[index],
                            );
                          },
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("My Favourites",style:AppColor.headingsstyles,),
                    SizedBox(height: 3,),
                    Container(
                      height: 3,
                      width: 145,
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
            ),
          ],
        ),
      ),
    );
  }
}
class RomanticMovies extends StatelessWidget {
  const RomanticMovies({
    this.colors
  }) ;
  final String colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>Channels(
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(borderRadius:  BorderRadius.circular(15),
                color:Colors.white
            ),
            child: Image.asset(colors,fit: BoxFit.fill,),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}
class ComedyMovies extends StatelessWidget {
  const ComedyMovies({
    this.colors
  }) ;
  final String colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>Channels(
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(borderRadius:  BorderRadius.circular(15),
                color:Colors.white
            ),
            child: Image.asset(colors,fit: BoxFit.fill,),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}

class HorrorMovies extends StatelessWidget {
  const HorrorMovies({
    this.colors
  }) ;
  final String colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>Channels(
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color:Colors.white
            ),
            child: Image.asset(colors,fit: BoxFit.fill,),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}
