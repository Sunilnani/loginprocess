import 'package:flutter/material.dart';
import 'package:flutter_app10008/channel.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> watchinglist=["img/channels/baboi.png","img/channels/v6-logo.png","img/channels/wrestle.png","img/channels/tv9.png",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(child: Text("News Channel",style: TextStyle(color: Colors.white))),
                          SizedBox(width: 5,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>HomePage(
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              child: Row(
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
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount:watchinglist.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return NewsChannel(
                              list: watchinglist[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(child: Text("Sports",style:  TextStyle(color: Colors.white))),
                          SizedBox(width: 5,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>HomePage(
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              child: Row(
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
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount:watchinglist.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Sports(
                              list: watchinglist[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(child: Text("Cartoons",style: TextStyle(color: Colors.white))),
                          SizedBox(width: 5,),
                          InkWell(
                            onTap: (){

                            },
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>HomePage(
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Text("All",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400)),
                                    SizedBox(width: 4,),
                                    Icon(Icons.arrow_forward_ios,color: Colors.white,size: 16,)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0),
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
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: 40,
                  width: 120,
                  child: Image(image: AssetImage("img/Home icons/logo 1.png",),fit: BoxFit.cover,)
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
                builder: (context) =>Channel(
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Image.asset(list,),
          ),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}


class Sports extends StatelessWidget {
  const Sports({
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
                builder: (context) =>Channel(
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Image.asset(list,),
          ),
        ),
        SizedBox(width: 10,)
      ],
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
                builder: (context) =>Channel(
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),
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