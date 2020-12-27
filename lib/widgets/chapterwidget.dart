import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novel/screens/ReadingScreen.dart';

import '../consttants.dart';

class Completechapterwidget extends StatelessWidget {
  final String id;
  final Size size;
  final int clength;

  const Completechapterwidget(
      {Key key, this.id, @required this.size, this.clength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.6,
        width: double.infinity,
        child: ListView.builder(
            itemCount: clength,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Chapterwidget2(
                size: size,
                text: "Chapter $index",
                press: () {
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ReadingScreen(id: id,index: index,);
                        },
                      ),
                    );
                  }
                },
              );
            })

// Chapterwidget2(
//       size: size,
//       text: "Chapter 1",
//       press: () {},
//     )

        );
  }
}

class Chapterwidget2 extends StatelessWidget {
  const Chapterwidget2({
    Key key,
    @required this.size,
    this.text,
    this.press,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: press,
              child: Chapter_widget(
                size: size,
                text: "${text}",
                press: press,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Chapter_widget extends StatelessWidget {
  const Chapter_widget({
    Key key,
    @required this.size,
    this.text,
    this.press,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - 48,
      margin: EdgeInsets.only(bottom: 10, top: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38.5),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color(0xFFD3D3D3).withOpacity(0.84),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            "${text} :",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: kBlackcolor),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onPressed: press),
        ],
      ),
    );
  }
}
