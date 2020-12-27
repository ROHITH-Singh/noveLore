import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:novel/consttants.dart';
import 'package:novel/widgets/book_ratings.dart';
import 'package:novel/widgets/read_button.dart';

class ImageCard extends StatelessWidget {
  final String image;

  const ImageCard({
    Key key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 10, top: 3, right: 5),
      height: 170,
      width: 140,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 160,
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
        ],
      ),
    );
  }
}
