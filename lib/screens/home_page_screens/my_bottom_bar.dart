import 'package:flutter/material.dart';
import 'file:///C:/Users/N%20SUNIL/AndroidStudioProjects/flutter_app10008/lib/screens/home_page_screens/searchingscreen.dart';
import 'file:///C:/Users/N%20SUNIL/AndroidStudioProjects/flutter_app10008/lib/screens/home_page_screens/settings.dart';
import 'package:flutter_app10008/styles/styles.dart';

import 'home.dart';
import 'likes.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({this.user});
  final String user;
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentindex=0;
  final List<Widget> _children=[HomePage(),SearchingScreen(),LikesScreen(),SettingsScreen()];
  void onTappedBar(int index){
    setState(() {
      _currentindex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:storeItems.backgroundcolors,
      body:_children[_currentindex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  offset: Offset(0,1)
              )
            ]

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
          child: BottomNavigationBar(
            onTap:onTappedBar,
            currentIndex: _currentindex,

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Image.asset("img/Home icons/Group.png",width: 20,),
                icon: Image.asset("img/Home icons/Group-1.png",width: 20,),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset("img/Home icons/search1.png",width: 20,),
                icon: Image.asset("img/Home icons/search.png",width: 20,),
                title: Text(''),
              ),

              BottomNavigationBarItem(
                activeIcon: Image.asset("img/Home icons/like1.png",width: 20,),
                icon: Image.asset("img/Home icons/like.png",width: 20,),
                title: Text(''),
              ),

              BottomNavigationBarItem(
                activeIcon: Image.asset("img/Home icons/settings1.png",width: 20,),
                icon: Image.asset("img/Home icons/setings.png",width: 20,),
                title: Text(''),
              ),
            ],
          ),
        ),
      ),

    );
  }
}

