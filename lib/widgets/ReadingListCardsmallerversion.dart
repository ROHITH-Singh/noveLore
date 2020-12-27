import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:novel/consttants.dart';
import 'package:novel/widgets/book_ratings.dart';
import 'package:novel/widgets/read_button.dart';

import 'hometime.dart';

class ReadingListCard1 extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final double rating;
  final Function pressRead;

  const ReadingListCard1({
    Key key,
    this.image,
    this.title,
    this.author,
    this.rating,
    this.pressRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       
      margin: EdgeInsets.only(bottom: 20 ,left:15,top: 0,right: 0),
      
      height: 250,
      width: 150,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.65), BlendMode.dstATop),
                ),
                
               
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 15,
                    color: kShadowcolor,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 3,
            child: Column(
              children: [
                   Container(
                  child:  Hometime(),
                ),
                // IconButton(
                //   icon: Icon(Icons.favorite_border),
                //   color: Colors.white,
                //   iconSize: 30,
                //   onPressed: () {},
                // ),
                Bookrating(
                  score: rating,
                )
              ],
            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              height: 70,
              width: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style:
                            TextStyle(color: Color.fromRGBO(255, 255, 184, 1)),
                        children: [
                          TextSpan(
                            text: " {$title}\n",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          TextSpan(text: author),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Read(text: "Read", press: pressRead),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
