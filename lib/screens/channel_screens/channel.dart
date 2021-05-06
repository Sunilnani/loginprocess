import 'dart:convert';
import 'package:better_player/better_player.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app10008/models/channels.dart';
import 'package:flutter_app10008/screens/home_page_screens/home.dart';
import 'package:flutter_app10008/screens/home_page_screens/my_bottom_bar.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../network_calls/base_network.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as a;

class Channels extends StatefulWidget {
  Channels({this.channelid});
  final int channelid;
  @override
  _ChannelsState createState() => _ChannelsState();
}

class _ChannelsState extends State<Channels> {
  Gradient g1 = LinearGradient(
    colors: [
      Colors.deepPurple,
      Colors.pinkAccent,
      Colors.redAccent,
      Colors.amber
    ],
  );
  List<String> watchinglist=["img/channels/baboi.png","img/channels/v6-logo.png","img/channels/wrestle.png","img/channels/tv9.png",];
  Videochannel videos= Videochannel();
  bool pressON = false;
  bool textadded = false;
  bool subscribe_on=false;
  bool subscribed=false;
  bool _fetching = true;

  void getHttp(index) async {

    setState(() {
      _fetching = true;
    });
    try {
      SharedPreferences prefs= await SharedPreferences.getInstance();
      String token = prefs.get("token");
      Response response = await dioClient.ref.get("/channel?channel_id=${widget.channelid}",
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
  void getfav() async {

    setState(() {
      _fetching = true;
    });
    try {
      SharedPreferences prefs= await SharedPreferences.getInstance();
      String token = prefs.get("token");
      Response response = await dioClient.ref.get("http://aparnamule.pythonanywhere.com/add_remove_favorites/?channel_id=${widget.channelid}",
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
    getHttp(widget.channelid);
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
              // padding: storeItems.paddings,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 70,),
                    _fetching ?  a.GradientCircularProgressIndicator(
                      valueGradient: g1,
                      backgroundColor: Colors.grey[200],
                    ):
                    Container(
                        height: 180,
                        width: double.infinity,
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFF707070)),
                        child: AspectRatio(
                          aspectRatio: 20 / 11,
                          child: BetterPlayer.network(
                            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                            betterPlayerConfiguration: BetterPlayerConfiguration(
                              aspectRatio: 16 / 9,
                            ),
                          ),
                        )

                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.all(8.0),
                            height:60,
                            width:50,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFF707070),
                                image: DecorationImage(image: NetworkImage("http://aparnamule.pythonanywhere.com${videos.image}"),fit: BoxFit.fill,)
                            ),

                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Action",style: (TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),),
                                    SizedBox(width: 5,),
                                    Text(".",style: (TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),),
                                    SizedBox(width: 5,),
                                    Text("Action",style: (TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),),
                                    SizedBox(width: 5,),
                                    Text(".",style: (TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),),
                                    SizedBox(width: 5,),
                                    Text("2021",style: (TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Text("Starring Arya,Sayeshaa",style: (TextStyle(color: Colors.white54,fontSize: 13,fontWeight: FontWeight.w300)),)
                              ],
                            ),
                          ),
                          Container(),
                          Container(
                            child: Image.asset("img/star.png",width: 25,),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        child:const Text(
                          'when a longer crosses paths with a live teddy bear, the unusual duo sets off an advanturous ride to scortland',
                          style: TextStyle(fontSize: 13,color: Colors.white54),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Container(
                        width: double.infinity,
                        height: 20,
                        child:const Text(
                          "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                          style: TextStyle(fontSize: 13,color: Colors.white10,),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                        ),
                      ),
                    ),
                    SizedBox(height:20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [

                                // Text("Add List",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),),
                                InkWell(
                                  onTap: (){
                                    setState(() => pressON = !pressON);
                                    setState(() => textadded = !textadded);
                                  },
                                  child: Container(
                                    child:  textadded ? Row(
                                      children: [
                                        Text(" List Added",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16))
                                      ],
                                    ):Row(
                                      children: [
                                        Icon(Icons.add,size: 18,color: Colors.white,),
                                        SizedBox(width: 3,),
                                        Text("Add List",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16))
                                      ],
                                    ),
                                    //    style: TextStyle(fontSize: 14)
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Image.asset("img/share.png",width: 20,),
                                SizedBox(width: 3,),
                                Text("Share",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),)
                              ],
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: (){
                                setState(() => subscribe_on = !subscribe_on);
                                setState(() => subscribed = !subscribed);
                              },
                              child: subscribed ? Text("Subscribed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),):
                              Row(
                                children: [
                                  Image.asset("img/transactions.png",width: 20,),
                                  SizedBox(width: 5,),
                                  Text("Subscribe",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        children: [
                          Text(videos.genre!=null?videos.genre:"loading....",style:storeItems.style),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount:watchinglist.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Cartoons(
                              list: watchinglist[index],
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
              padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>MyBottomNavigationBar(
                                  ),
                                ),
                              );
                            },
                            child: Container(
                                width: 28,
                                child: Image.asset("img/arrowback.png",fit: BoxFit.cover,)),
                          ),
                          SizedBox(width: 20,),
                          Text(videos.name!=null?videos.name:"loading....",style: GoogleFonts.montserrat(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 22),)
                        ],
                      ),
                    ),
                    Container(
                      child: Image.asset("img/Home icons/search.png",width: 20,color: Colors.white,),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Cartoons extends StatelessWidget {
  const Cartoons({
    this.list
  }) ;
  final String list;

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
              color:Colors.white,

            ),
            child: Image.asset(list,),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}

//
// List<BetterPlayerDataSource> createDataSet() {
//   List dataSourceList = List<BetterPlayerDataSource>();
//   dataSourceList.add(
//     BetterPlayerDataSource(
//       BetterPlayerDataSourceType.network,
//       "http://aparnamule.pythonanywhere.com${}",
//     ),
//   );
//
//   return dataSourceList;
// }