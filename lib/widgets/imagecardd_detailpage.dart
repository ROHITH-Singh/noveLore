import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:novel/consttants.dart';
import 'package:novel/widgets/book_ratings.dart';
import 'package:novel/widgets/read_button.dart';

class ImageCard1 extends StatelessWidget {
  final String image;

  const ImageCard1({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 0, top: 3, right: 5),
      height: 260,
      width: 150,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 210,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fill,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.8), BlendMode.dstATop),
                ),
                borderRadius: BorderRadius.circular(30),
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
        ],
      ),
    );
  }
}
