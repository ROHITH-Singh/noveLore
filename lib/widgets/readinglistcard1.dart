

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novel/screens/detail_chapter.dart';

import 'ReadingListCardsmallerversion.dart';

SingleChildScrollView smallreadingCardwithhorizontALSCROLL() {
    


  return SingleChildScrollView(
    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        ReadingListCard1(
            image: "assets/images/mi8dwj1a38n31 (1).jpg",
            title: "Solo Leveling",
            author: "chugong",
            rating: 8.9,
            pressRead: () { }),
        ReadingListCard1(
          image: "assets/images/96b10d3005ebeee4f3d6e36a1663e100.jpg",
          title: "Your Lie in...",
          author: '',
          rating: 8.9,
          pressRead: () {},
        ),
        ReadingListCard1(
          image: "assets/images/e33662ca9ac3608dbcdf03849c278345.jpg",
          title: "Deaths",
          author: "DC",
          rating: 8.9,
          pressRead: () {},
        ),
        SizedBox(
          width: 30,
        )
      ],
    ),
  );
}
