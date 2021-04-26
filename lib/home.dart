import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  HomePage({this.user});

  final String user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
