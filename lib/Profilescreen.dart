// import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:novel/widgets/profile_list_item.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';

class Profilescreen extends StatefulWidget {
  final String uid;
  const Profilescreen({Key key, this.uid}) : super(key: key);
  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.uid);
    return Container(
      
      child: Text(widget.uid),
    );
  }
}
