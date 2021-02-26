// import 'dart:html';
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:http/http.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart ';
import 'package:flutter/rendering.dart';
import 'package:novel/consttants.dart';
import 'package:novel/models/FirstData.dart';
import 'package:novel/screens/favourite.dart';
import 'package:novel/screens/profile.dart';
import 'package:novel/screens/write.dart';

import 'package:novel/widgets/HomeScreenwidget.dart';
import 'package:novel/widgets/ReadingListCardsmallerversion.dart';
import 'package:novel/widgets/book_ratings.dart';
import 'package:novel/widgets/boxsimplewithreadandimage.dart';
import 'package:novel/widgets/justbottomimage.dart';
import 'package:novel/widgets/read_button.dart';
import 'package:novel/widgets/readinglistcard1.dart';
import 'package:novel/widgets/title_author_read.dart';

import 'detail_chapter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  bool _visible = true;
  String text = "Home";
  String url = "https://noveloreapi.herokuapp.com/first ";
  List<FirstData> firstlore = new List();
  int firstlength;
  bool widget1 = false;

  @override
  void initState() {
    super.initState();
    this._getrequest();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() => _visible = false);
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() => _visible = true);
      }
    });
  }

  Future<List<FirstData>> _getrequest() async {
    String Url = "https://noveloreapi.herokuapp.com/first";
    Response response = await http.get(Uri.encodeFull(Url));
    try {
      var rb = response.body;
      print(rb);
      var list = jsonDecode(rb) as List;

      List<FirstData> listvalues =
          list.map((e) => FirstData.fromJson(e)).toList();

      setState(() {
        firstlore.addAll(listvalues);
        firstlength = listvalues.length;
      });
    } catch (err) {
      print(err);
    }
  }

  _onTap(int index) {
    switch (index) {
      case 0:
        setState(() => text = 'Home');
        break;
      case 1:
        setState(() => Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new favourite();
            })));
        break;
      case 2:
        setState(() => Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new write();
            })));
        break;
      case 3:
        setState(() => Navigator.of(context)
                .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
              return new profile();
            })));
        break;

      default:
        setState(() => text = 'Home');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int min = 20, max = 40; //not used
    Random rnd = new Random(); //not used
    int r = 0; //for future ui randomness
    int homechecking = 0;
    double x = 22, y = 15;
    final orientation = MediaQuery.of(context).orientation;

    if (firstlength != null) {
      return GestureDetector(
        onVerticalDragDown: (details) {
          r = rnd.nextInt(max - min);
        },
        child: Scaffold(
          extendBodyBehindAppBar: false,
          backgroundColor: Color(0xff392850),
          appBar: AppBar(
            brightness: Brightness.light,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                FlatButton(
                  onPressed: () {
                    if (homechecking == 1) {
                      x = 22;
                      y = 15;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          homechecking = 0;
                          return HomeScreen();
                        }),
                      );
                    }
                    ;
                  },
                  child: Text("Home",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: x,
                          fontWeight: FontWeight.w900)),
                ),
                FlatButton(
                  onPressed: () {
                    if (homechecking == 0) {
                      x = 15;
                      y = 22;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          homechecking = 1;
                          return SearchScreen(homechecking, x, y);
                        }),
                      );
                    }
                  },
                  child: Text("Search",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: y,
                          fontWeight: FontWeight.w900)),
                )
              ],
            ),
            actions: [],
          ),
          body: Container(
            width: double.infinity,

            //  /height: 500,
            child:
                // StaggeredGridView.countBuilder(
                //   crossAxisCount: 4,
                //   mainAxisSpacing: 150,
                //   crossAxisSpacing: 20,
                //   padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                //   itemCount: 10,
                //   itemBuilder:  (context, index) {
                //        if (index != null) {
                //          return Container(
                //           child: listcard1(index, context),
                //        );}
                //          return Container(
                //            child: Text("loading"),
                //          );

                //      },

                //       staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2:1),

                // )

                GridView.builder(
                    itemCount: firstlength,
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 3,
                        childAspectRatio: 0.55),
                    itemBuilder: (context, index) {
                      if (index != null) {
                        return Container(
                          child: listcard1(index, context),
                        );
                      }
                      return Container(
                        child: Text("loading"),
                      );
                    }),
          ),
          extendBody: true,
          bottomNavigationBar: !_visible
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 30, right: 30),
                  child: bottomnavigation(),
                ),
        ),
      );
    }
    return AnimatedSplashScreen(
      nextScreen: HomeScreen(),
      splash: Image.asset("assets/images/emotion.png"),
      splashTransition: SplashTransition.rotationTransition,
      duration: 5000,
      backgroundColor: Color(0xff392850),
    );
  }

  ReadingListCard listcard1(int index, BuildContext context) {
    {
      List<String> img = firstlore[index].imgthmp.split("/");
      String img1 = img[0] + "//" + img[2] + "/public/" + img[3] + "/" + img[4];
      print(img1);
      print(index);
      return ReadingListCard(
        id: firstlore[index].id,
        image: img1,
        title: firstlore[index].title,
        author: firstlore[index].author,
        rating: 8.9,
        pressRead: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                print(firstlore[index].id);
                return DetailScreen(id: firstlore[index].id);
              },
            ),
          );
        },
      );
    }
  }

  ClipRRect bottomnavigation() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(70),
      child: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color),
            title: Text("write"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   title: Text("Settings"),
          // ),
        ],
        onTap: _onTap,
      ),
    );
  }

  Widget SearchScreen(int homechecking, double x, double y) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            FlatButton(
              onPressed: () {
                if (homechecking == 1) {
                  x = 22;
                  y = 15;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      homechecking = 0;
                      return HomeScreen();
                    }),
                  );
                }
                ;
              },
              child: Text("Home",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: x,
                      fontWeight: FontWeight.w900)),
            ),
            FlatButton(
              onPressed: () {
                if (homechecking == 0) {
                  x = 15;
                  y = 22;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      homechecking = 1;
                      return SearchScreen(homechecking, x, y);
                    }),
                  );
                }
              },
              child: Text("Search",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: y,
                      fontWeight: FontWeight.w900)),
            )
          ],
        ),
        actions: [],
      ),
    );
  }
}
