import 'package:flutter/material.dart';
import 'package:flutter_app10008/styles/styles.dart';
class SearchingScreen extends StatefulWidget {
  @override
  _SearchingScreenState createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  List<String> search_list=["Marvel","Iron man","Ipl live","Spiderman","wonderwoman"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: storeItems.backgroundcolors,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,size: 20,color: Colors.grey[900],),
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.grey[900],fontSize: 16,fontWeight: FontWeight.w600),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 60,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Recent Searches",style: AppColor.headingsstyles),
                      SizedBox(height: 3,),
                      Container(
                        height: 3,
                        width: 180,
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
                SizedBox(height: 20,),

                ListView.builder(
                  itemCount: search_list.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    return RecentList(
                      recentsearch: search_list[index],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecentList extends StatelessWidget {
  const RecentList({
    this.recentsearch
  }) ;
  final String recentsearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(recentsearch,style: TextStyle(color: Color(0xFFFF8D1B),fontWeight: FontWeight.w600,fontSize: 18),),
        SizedBox(height: 10,)
      ],
    );
  }
}
