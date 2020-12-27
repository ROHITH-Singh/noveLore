
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novel/widgets/read_button.dart';

import '../consttants.dart';
import 'book_ratings.dart';
import 'hometime.dart';
import 'imagecardd_detailpage.dart';

Row detailpagecard1(BuildContext context,String id,
  String imgthmp,
  String title,
  String author,
  String description,) {

   String id1=id;
  String imgthmp1=imgthmp;
  String title1=title;
  String author1=author;
  String description1=description;

  
  





      return Row(
                           
                            children: [
                              Expanded(
                                child: Column(
                                  
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                 description1,
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: kBlackcolor),
                                                maxLines: 15,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                      child:  Hometime(id: id1,title: title1,image: imgthmp1,author: author1,),
                                              ),
                                            Bookrating(
                                              score: 8.6,
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ImageCard1(
                                image: imgthmp1,
                              )
                            ],
                          );
    }
  
 

