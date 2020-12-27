
import 'package:flutter/material.dart ';
import 'package:novel/consttants.dart';

class Bookrating extends StatelessWidget {
  final double score;
  const Bookrating({
    Key key, this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: Color(0xFD3D3D3D).withOpacity(.3),
          )
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.star,
            color: kIconColor,
            size: 30,
          ),
          SizedBox(height: 5),
          Text(
            "${this.score}",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
