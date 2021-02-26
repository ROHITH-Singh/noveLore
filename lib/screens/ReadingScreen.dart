import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:novel/models/ContentData.dart';

class ReadingScreen extends StatefulWidget {
  final String id;
  final int index;

  const ReadingScreen({Key key, this.id, this.index}) : super(key: key);

  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  String content;
  int length;
  bool widget2 = false;
  @override
  void initState() {
    super.initState();
    this._getrequest();
  }

  Future<List<ContentData>> _getrequest() async {
    String Url = "https://noveloreapi.herokuapp.com/chapter/" +
        widget.id +
        "/" +
        widget.index.toString();
    print(Url);

    Response response = await http.get(Uri.encodeFull(Url));

    var rb = response.body;

    var list = jsonDecode(rb) as List;

    List<ContentData> listvalues =
        list.map((e) => ContentData.fromJson(e)).toList();

    setState(() {
      length = listvalues.length;
      content = listvalues[0].content;
      widget2 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (length != null) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 30,
        ),
        color: Colors.white70,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Text(
            content,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                decoration: TextDecoration.none),
          ),
        ),
      );
    } else {
      return AnimatedSplashScreen(
        splash: Image.asset("assets/images/emotion.png"),
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: ReadingScreen(id: widget.id,index: widget.index,),
        duration: 7000,
        backgroundColor: Color(0xff392850),
      );
    }
  }
}
