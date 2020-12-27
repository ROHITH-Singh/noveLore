import 'package:flutter/cupertino.dart';
import 'package:novel/widgets/justbottomimage.dart';
import 'package:novel/widgets/read_button.dart';
import 'package:flutter/material.dart ';

class BoxwithsimpleUI extends StatelessWidget {
  final String text;
  final String author;
  final String image;
  final Function press;

  const BoxwithsimpleUI(
      {Key key,
      @required this.size,
      this.text,
      this.author,
      this.image,
      this.press})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              padding:
                  EdgeInsets.only(left: 10, top: 24, right: size.width * 0.35),
              height: 185,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFFEAEA).withOpacity(0.40),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        TextSpan(
                          text: "${text}\n",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "by \n${author}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: SizedBox(
                        height: 40,
                        width: size.width * 0.45,
                        child: Read(
                          text: "Read",
                          radius: 30,
                          press: press,
                        )

                        //
                        ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            width: size.width * .35,
            child: ImageCard(
              image: image,
            ),
          ),
        ],
      ),
    );
  }
}
