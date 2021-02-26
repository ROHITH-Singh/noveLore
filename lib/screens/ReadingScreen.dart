import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:novel/models/ContentData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

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
    var x = Colors.white;
    var y = Colors.black;
    var t;
    var z = 0;

    if (length != null) {
      return Center(
          child: ListView(
        children: [
          // Container(
          //   alignment: new Alignment(0.9, 0.9),
          //   color: Colors.white,
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Icon(
          //       Icons.brightness_4,
          //       color: y,
          //       size: 40,
          //     ),
          //   ),
          // ),
          Container(
            // padding: const EdgeInsets.symmetric(
            //   horizontal: 5,
            //   vertical: 50,
            // ),
            color: x,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                content,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: y,
                    decoration: TextDecoration.none),
              ),
            ),
          )
        ],
      ));
    } else {
      return AnimatedSplashScreen(
        splash: Image.asset("assets/images/emotion.png"),
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: ReadingScreen(
          id: widget.id,
          index: widget.index,
        ),
        duration: 7000,
        backgroundColor: Color(0xff392850),
      );
    }
  }
}
