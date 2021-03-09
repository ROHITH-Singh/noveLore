import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:novel/consttants.dart';
// import 'package:novel/widgets/book_ratings.dart';
import 'package:novel/widgets/hometime.dart';
// import 'package:novel/widgets/read_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ReadingListCard extends StatefulWidget {
  final String id;
  final String image;
  final String title;
  final String author;
  final double rating;
  final Function pressRead;
  
  @override
 
   ReadingListCard({
    Key key,
    this.id,
    this.image,
    this.title,
    this.author,
    this.rating,
    this.pressRead,
  }) : super(key: key);

  @override
  _ReadingListCardState createState() => _ReadingListCardState();
}

class _ReadingListCardState extends State<ReadingListCard> {
 

  @override
  Widget build(BuildContext context) {
    bool onliked = false;
    var IconColor = Colors.white;
    
        return GestureDetector(
         
        onTap: widget.pressRead,
        child: Container(
          height:MediaQuery.of((context)).size.height /4 ,
          margin: EdgeInsets.only(bottom: 20, left: 5, top: 0, right: 5),
        
        
          child: Stack(
            
            fit:StackFit.loose,
            children: [
              Positioned(
                child: Container(
                  alignment: Alignment.topCenter,
                  
                  height: MediaQuery.of((context)).size.height /2  ,
                  
                  
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.fill,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                    ),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 8),
                        blurRadius: 20,
                        color: kShadowcolor1,
                      ),
                    ],
                  ),

            child: Stack(children: [
              Positioned(
                top: 15,
                right: 3,
                child: Column(
                  children: [
                    Container(
                      child: Hometime(id: widget.id,title: widget.title,author: widget.author,image: widget.image,),
                    )
                    
                  ],
                ),
              ),
                  Positioned(
                    left: 5,
                top: 50,
                child: Container(
                  alignment: Alignment(0,3),
                  height: 200,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // padding: EdgeInsets.only(left: 2),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            children: [
                              TextSpan(
                                text: " ${widget.title}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Colors.yellowAccent
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              )






            ],)





                ),
              ),
              
            ],
          ),
        ));
  }
}
