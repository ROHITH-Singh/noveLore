import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:novel/consttants.dart';
import 'package:novel/widgets/book_ratings.dart';

class Read extends StatelessWidget {
  final String text;
  final double radius;
  final Function press;
  const Read({
    Key key,
    this.text,
    this.radius =30 ,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
          SizedBox( height: 30,
                      child: GestureDetector( 
                
                        child: RaisedButton(
                          hoverColor: Colors.black,
      child: Text("${text}"),
      onPressed: press,
      splashColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(color: Colors.black),
      ),
    ),
            ),
          );
  }
}
