import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app10008/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'channel.dart';
import '../home_page_screens/home.dart';
import '../../models/genres.dart';
import '../../network_calls/base_network.dart';
class AllChannels extends StatefulWidget {
  AllChannels({this.genreid, this.genrename});
  final int genreid;
  final String genrename;
  @override
  _AllChannelsState createState() => _AllChannelsState();
}

class _AllChannelsState extends State<AllChannels> {
  List<Welcome> listTodos=List();
  List<Channel> channels=List();
  void getHttp(index) async {

    setState(() {

    });
    try {
      SharedPreferences prefs= await SharedPreferences.getInstance();
      String token = prefs.get("token");
      Response response = await dioClient.ref.get("/genre_details?genre_id=${widget.genreid}",
          options: Options(
              validateStatus: (status) => status < 500,
              headers: {
                "Authorization":"Bearer $token"
              }
          )
      );


      setState(() {
        listTodos = welcomeFromJson(jsonEncode(response.data));
        channels=listTodos[0].channels;

        // for(var i=0;i<listTodos.length;i++){
        //   print(listTodos[i].channels.length);
        //   var candy= listTodos[i].channels.length;
        //   print("variage is ${candy}");
        // }

        List<Channel> channelslist=listTodos[0].channels;
        print("indian channelsis ${channelslist.length}");

      });
      print(response);
    } catch (e) {
      setState(() {
      });
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getHttp(widget.genreid);
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
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 70,),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                  ),
                                ),
                              );
                            },
                            child: Container(
                                width: 28,
                                child: Image.asset("img/arrowback.png",fit: BoxFit.cover,)),
                          ),
                          SizedBox(width: 20,),
                          Text("${widget.genrename}",style:GoogleFonts.montserrat(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:channels.length,
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,crossAxisSpacing:15, mainAxisSpacing: 15),
                            itemBuilder: (context, index) {
                              return ChannelCateg(
                                langlist:channels[index].image,
                                channelsids: channels[index].channelId,
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
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
          )
      ),
    );
  }
}
class ChannelCateg extends StatelessWidget {
  const ChannelCateg({
    this.langlist,
    this.channelsids,
    Key key,
  }) : super(key: key);
  final String langlist;
  final int channelsids;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>Channels(
              channelid: channelsids,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 50,
        width: 100,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
            image: DecorationImage(image: NetworkImage("http://aparnamule.pythonanywhere.com${langlist}"))
          // image: DecorationImage(
          //   image: NetworkImage(widget.images),fit: BoxFit.cover
          //),
        ),
        //child: Text(langlist)


      ),
    );
  }
}