import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:novel/models/ContentData.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../constants.dart';

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
  var url = Uri.https(
        'noveloreapi.herokuapp.com', '/chapter/' + widget.id+'/'+widget.index.toString(), {'q': '{http}'});
    Response response = await http.get((url));

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

  ThemeData _lightTheme = ThemeData(
      accentColor: Colors.pink,
      brightness: Brightness.light,
      primaryColor: Colors.blue);

  ThemeData _darktheme = ThemeData.from(
    colorScheme: ColorScheme(
        primary: Color(0xff272727),
        primaryVariant: Color(0xff000000),
        secondary: Color(0xff66fff9),
        secondaryVariant: Color(0xff66fff9),
        surface: Color(0xff003366),
        background: Color(0xff160c16),
        error: Color(0xff9b374d),
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        onSurface: Colors.black,
        onBackground: Colors.white,
        onError: Colors.black,
        brightness: Brightness.dark),
  );
// (
//     accentColor: Colors.black,
//     brightness: Brightness.dark,
//     primaryColor: Colors.black);

  bool _light = true;
  Color x = Colors.white70;
  Color y = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    if (length != null) {
      return MaterialApp(
        theme: _light ? _darktheme : _lightTheme,
        home: Scaffold(
          // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
            floatingActionButton: FloatingActionButton( 
              backgroundColor: x,
              onPressed: () {
                setState(() {
                  _light = !_light;
                  if (_light)
                    x = Colors.white70;
                  else
                    x = Color(0xff392850);
                });
              },
              child: Icon(
                Icons.brightness_4,
                size: 24,
              ),
            ),
            body: Center(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 30)),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    content,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                  ),
                ),
              ],
            )))),
      );
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
