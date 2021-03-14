import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novel/models/FirstData.dart';
import 'package:novel/screens/home_screen.dart';

class loading extends StatefulWidget {
  bool x;
  List<FirstData> saved;
  @override
  loading({Key key, this.x, this.saved}) : super(key: key);
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
    if (widget.saved.isEmpty) {
      return Scaffold(
        backgroundColor: Color(0xffFC5d5b),
        body: Center(
          child: Text(
            "check Connection ",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return HomeScreen(
        x: widget.x,
        saved: widget.saved,
      );
    }

    ;
  }
}
