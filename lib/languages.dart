import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/genres.dart';


class AllChannels extends StatefulWidget {
  @override
  _AllChannelsState createState() => _AllChannelsState();
}

class _AllChannelsState extends State<AllChannels> {
  List<Welcome> listTodos = List();
  bool _fetching = true;

  void getHttp() async {
    setState(() {
      _fetching = true;
    });

    try {
      Response response =
      await Dio().get("http://aparnamule.pythonanywhere.com/genre_details/");
      setState(() {
        listTodos = welcomeFromJson(jsonEncode(response.data));
        _fetching = false;

        print(listTodos[0].genreName);
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
      appBar: AppBar(),
      body: Column(
        children: [
          // RaisedButton(
          //   child: Text(
          //     "Get Data",
          //   ),
          //   onPressed: () {
          //     getHttp();
          //   },
          // ),
          // Text("${listTodos.length}"),
          _buildBody()
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_fetching) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (listTodos.length == 0) {
      return Center(
        child: Text("No Data"),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: listTodos.length,
        itemBuilder: (context, index) {
          Welcome todo = listTodos[index];
          // Welcome current = listTodos as Welcome;
          return ListTile(
            title: Text(listTodos[index].genreName,style: TextStyle()),

          );
        },
      ),
    );
  }
}
