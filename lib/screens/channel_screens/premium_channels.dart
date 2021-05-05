import 'package:flutter/material.dart';
import 'package:flutter_app10008/screens/home_page_screens/settings.dart';
import 'package:flutter_app10008/screens/payment_screen.dart';
import 'package:flutter_app10008/styles/styles.dart';


class Premium extends StatefulWidget {
  @override
  _PremiumState createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  List<String> watchinglist=["img/channels/favourites1.png","img/channels/favourites2.png","img/channels/favourites3.png","img/channels/favourites1.png","img/channels/favourites2.png",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: storeItems.backgroundcolors,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xFF707070)),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        children: [
                          Text("Top Rated",style: storeItems.style),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount:watchinglist.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return WatchingList(
                              list: watchinglist[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        children: [
                          Text("Female lead",style: storeItems.style),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount:watchinglist.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return MyList(
                              list: watchinglist[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:20.0),
                      child: Row(
                        children: [
                          Text("marvel Movies",style: storeItems.style),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,)
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left:20.0),
                      child: Container(
                        height: 80,
                        child: ListView.builder(
                          itemCount:watchinglist.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return Movies(
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
                      Text("Premium",style: AppColor.headingsstyles)
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
class WatchingList extends StatelessWidget {
  const WatchingList({
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
                builder: (context) =>Payment(
                ),
              ),
            );
          },
          child: Container(
            height: 80,
            width: 130,
            decoration: BoxDecoration(borderRadius: storeItems.radius,
              color: Colors.white,
            ),
            child: Image.asset(list,fit: BoxFit.fill,),
          ),

        ),
        SizedBox(width: 10,)
      ],
    );
  }
}


class MyList extends StatelessWidget {
  const MyList({
    this.list
  }) ;
  final String list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 130,
          decoration: BoxDecoration(borderRadius: storeItems.radius,
            color: Colors.white,
          ),
          child: Image.asset(list,fit: BoxFit.fill,),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}
class Movies extends StatelessWidget {
  const Movies({
    this.list
  }) ;
  final String list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 130,
          decoration: BoxDecoration(borderRadius: storeItems.radius,
            color: Colors.white,
          ),
          child: Image.asset(list,fit: BoxFit.fill,),
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}