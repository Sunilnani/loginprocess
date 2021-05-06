import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app10008/models/genres.dart';
import 'package:flutter_app10008/screens/channel_screens/languages.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gradient_ui_widgets/gradient_ui_widgets.dart' as gradient_ui;

import '../../network_calls/base_network.dart';
import '../channel_screens/channel.dart';
class HomePage extends StatefulWidget {
  HomePage({this.user});
  final String user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gradient gradient = LinearGradient(
    colors: [
      Colors.deepPurple,
      Colors.pinkAccent,
      Colors.redAccent,
      Colors.amber
    ],
  );
  List<Welcome> listTodos = List();
  List<Channel> channels=List();

  bool _fetching = true;
  Channel todo;
  // void chan(value){
  //   channels=listTodos[value].channels;
  //   print("value is ${channels.length}");
  // }

  void getHttp() async {
    setState(() {
      _fetching = true;
    });
    try {
      SharedPreferences prefs= await SharedPreferences.getInstance();
      String token = prefs.get("token");
      Response response = await dioClient.ref.get("/genre_details/",
          options: Options(
              validateStatus: (status) => status < 500,
              headers: {
                "Authorization":"Bearer $token"
              }
          )
      );
      setState(() {
        listTodos = welcomeFromJson(jsonEncode(response.data));
        _fetching = false;
        print(listTodos.length);

       // var variable=listTodos.forEach((element)=>print("bloody rock${element.channels.length}"));
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
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: storeItems.backgroundcolors,
      body: SafeArea(
        child: Stack(
          children: [
            _fetching ? Align(
              alignment: Alignment.center,
              child: gradient_ui.GradientCircularProgressIndicator(
                valueGradient: gradient,
                backgroundColor: Colors.grey[200],
              ),
            ):
            Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      ListView.builder(
                        itemCount: listTodos.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, position) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:25.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(child: Text(listTodos[position].genreName,style: storeItems.style)),
                                    SizedBox(width: 5,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => AllChannels(genreid:listTodos[position].genreId,genrename: listTodos[position].genreName,
                                            ),
                                          ),
                                        );
                                      },

                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("All",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),
                                              SizedBox(width: 4,),
                                              Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,)
                                            ],
                                          ),

                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left:25.0),
                                child: Container(
                                  height: 80.0,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: listTodos[position].channels.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return NewsChannel(
                                        list:listTodos[position].channels[index].image ,
                                        channelids: listTodos[position].channels[index].channelId,
                                      );

                                    },
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      )
                    ],
                  ),
                )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                    height: 40,
                    width: 120,
                    child: Image(image: AssetImage("img/Home icons/logo 1.png",),fit: BoxFit.cover,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class NewsChannel extends StatelessWidget {
  const NewsChannel({
    this.todo,
    this.list,
    this.channelids,
  }) ;
  final String list;
  final Channel todo;
  final int channelids;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>Channels(
                  channelid: channelids,
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),
                color: Colors.white,
                image: DecorationImage(image: NetworkImage("http://aparnamule.pythonanywhere.com${list}"))
            ),
            // child: Text(list,),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}


