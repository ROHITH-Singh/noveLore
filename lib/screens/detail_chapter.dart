import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:novel/consttants.dart';
import 'package:novel/models/LengthData.dart';
import 'package:novel/models/SecondData.dart';
import 'package:novel/widgets/book_ratings.dart';
import 'package:novel/widgets/chapterwidget.dart';
import 'package:novel/widgets/detailpagecard1.dart';
import 'package:novel/widgets/imagecardd_detailpage.dart';
import 'package:novel/widgets/justbottomimage.dart';
import 'package:novel/widgets/read_button.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({Key key, @required this.id});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<SecondData> secondlore = new List();
  int clength;

  @override
  void initState() {
    super.initState();
    this._getrequest();
  }

  Future<List<SecondData>> _getrequest() async {
    // String Url = "https://noveloreapi.herokuapp.com/second/" + widget.id;
    var url = Uri.https(
        'noveloreapi.herokuapp.com', '/second/' + widget.id, {'q': '{http}'});
    // String Url1 =
    //     "https://noveloreapi.herokuapp.com/second/" + widget.id + "/size";
        var url1= Uri.https(
        'noveloreapi.herokuapp.com', '/second/' + widget.id+'/size', {'q': '{http}'});
    print(url1);
    Response response = await http.get(url);
    Response response1 = await http.get((url1));
    var rb = response.body;
    var rb1 = response1.body;

    var list = jsonDecode(rb) as List;
    var sizedata = jsonDecode(rb1) as List;

    List<SecondData> listvalues =
        list.map((e) => SecondData.fromJson(e)).toList();
    List<LengthData> listvalues1 =
        sizedata.map((e) => LengthData.fromJson(e)).toList();

    setState(() {
      secondlore.addAll(listvalues);
      print(listvalues1);
      clength = listvalues1[0].chapterslength;
      print("from inside setstate $clength");
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // print("second lore  $secondlore $clength");

    if (clength != null) {
      List<String> img = secondlore[0].imgthmp.split("/");
      String img1 = img[0] + "//" + img[2] + "/public/" + img[3] + "/" + img[4];
      print("$clength");
      return Scaffold(
        
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    
                    // height: size.height * .55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      
                      image: DecorationImage(image: NetworkImage(img1),fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.55), BlendMode.dstOut)
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff392850),
                          Colors.white,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .08,
                          ),
                          detailpagecard1(
                              context,
                              secondlore[0].id,
                              img1,
                              secondlore[0].title,
                              secondlore[0].author,
                              secondlore[0].description),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Completechapterwidget(
                id: secondlore[0].id,
                size: size,
                clength: clength,
              ),
            ],
          ),
        ),
      );
    } else {
      return AnimatedSplashScreen(
        nextScreen: DetailScreen(id: widget.id),

        splash: Image.asset("assets/images/emotion.png"),
        splashTransition: SplashTransition.rotationTransition,
        // duration: 7000,
        backgroundColor: Color(0xff392850),
      );
    }
  }
}
