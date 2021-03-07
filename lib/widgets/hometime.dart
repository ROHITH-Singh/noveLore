import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novel/consttants.dart';

class Hometime extends StatefulWidget {
  final String id;
  final String image;
  final String title;
  final String author;
  final double rating;
  final Function pressRead;

  Hometime({
    Key key,
    this.id,
    this.image,
    this.title,
    this.author,
    this.rating,
    this.pressRead,
  }) : super(key: key);

  @override
  _HometimeState createState() => _HometimeState();
}

class _HometimeState extends State<Hometime> {
  bool onliked = false;
  Color color = Colors.white;
  GlobalKey _globalKey = GlobalKey();
  // final List<GlobalObjectKey<FormState>> _globalKey =
  //     List.generate(10, (index) => GlobalObjectKey > (index));
  Widget build(BuildContext context) {
    return GestureDetector(
       key: _globalKey,
      onTap: () {
        setState(() {
          onliked = !onliked;
          print(onliked);
        });
      },
      child: onliked
          ? IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
              onPressed: null,
              iconSize: 30,
              color: Colors.white,
            )
          : IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: color,
              ),
              onPressed: () {
                return showDialog(
                  context: _globalKey.currentContext,
                  builder: (ctx) => AlertDialog(
                    backgroundColor: Colors.amberAccent[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    title: Text(
                      "${widget.title} \nadded to library",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff392850),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            onliked = !onliked;
                            Navigator.of(ctx).pop();
                          });
                        },
                        child: Text("ok"),
                      ),
                    ],
                  ),
                );
              },
              iconSize: 30,
              color: Colors.red,
            ),
    );
  }
}
