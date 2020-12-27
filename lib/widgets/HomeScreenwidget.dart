import 'package:flutter/cupertino.dart';
import 'package:novel/widgets/title_author_read.dart';
import 'package:flutter/material.dart ';
import 'ReadingListCardsmallerversion.dart';
import 'boxsimplewithreadandimage.dart';

class Homescreenwidget extends StatelessWidget {
  const Homescreenwidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/main_page_bg.png"),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * .1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.display1,
                  children: [
                    TextSpan(text: "what are you \nreading "),
                    TextSpan(
                      text: "today?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ReadingListCard(
                    image: "assets/images/mi8dwj1a38n31 (1).jpg",
                    title: "Solo Leveling",
                    author: "chugong",
                    rating: 8.9,
                    pressRead: () {},
                  ),
                  ReadingListCard(
                    image: "assets/images/96b10d3005ebeee4f3d6e36a1663e100.jpg",
                    title: "Your Lie in April",
                    author: '',
                    rating: 8.9,
                    pressRead: () {},
                  ),
                  ReadingListCard(
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline5,
                      children: [
                        TextSpan(
                          text: "Best of the ",
                        ),
                        TextSpan(
                          text: "Day",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  BoxwithsimpleUI(
                      size: size,
                      text: "Best for becoming mad?",
                      author: "Rohithkumarsingh",
                      image: "assets/images/buddha.jpg",
                      press: () {}),
                ],
              ),
            ),
                 Text("Geners:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
                Text("Romance=>",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30),),
                smallreadingCardwithhorizontALSCROLL(),
                Text("SCI-FI=>",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30),),
                smallreadingCardwithhorizontALSCROLL(),
                Text("Fantasy=>",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30),),
                smallreadingCardwithhorizontALSCROLL(),
              
          ],
        ),
      ),
    );
  }

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
            pressRead: () {},
          ),
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
}
