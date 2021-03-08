// import 'dart:html';
import 'dart:convert';
// import 'dart:ffi';
import 'dart:math';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart ';
import 'package:flutter/rendering.dart';
// import 'package:novel/consttants.dart';
import 'package:novel/models/FirstData.dart';
import 'package:novel/screens/ProfilePage.dart';
import 'package:novel/screens/favourite.dart';

import 'package:novel/screens/write.dart';
import 'package:novel/widgets/hometime.dart';

// import 'package:novel/widgets/HomeScreenwidget.dart';
// import 'package:novel/widgets/ReadingListCardsmallerversion.dart';
// import 'package:novel/widgets/book_ratings.dart';
// import 'package:novel/widgets/boxsimplewithreadandimage.dart';
// import 'package:novel/widgets/justbottomimage.dart';
// import 'package:novel/widgets/read_button.dart';
// import 'package:novel/widgets/readinglistcard1.dart';
import 'package:novel/widgets/title_author_read.dart';

import 'detail_chapter.dart';

class HomeScreen extends StatefulWidget {
  bool x;
  List<FirstData> saved;

  @override
  HomeScreen({Key key, this.x, this.saved}) : super(key: key);
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool x;
 
  
  ScrollController _scrollController;
  bool _visible = true;
  String text = "Home";
  String url = "https://noveloreapi.herokuapp.com/first ";

  List<FirstData> firstlore = [];

  int firstlength;
  bool widget1 = false;
  bool widget2 = false;

  @override
  void initState() {
    x = this.widget.x;
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
    print("upper future");
    print(x);
    // String Url = "https://noveloreapi.herokuapp.com/first";
    if (!x) {
      var url =
          Uri.https('noveloreapi.herokuapp.com', '/first/', {'q': '{http}'});
      Response response = await http.get((url));
      try {
        var rb = response.body;

        print(rb);
        var list = jsonDecode(rb) as List;

        List<FirstData> listvalues =
            list.map((e) => FirstData.fromJson(e)).toList();

        setState(() {
          firstlore.addAll(listvalues);
          x = true;
          widget2 = true;
          firstlength = listvalues.length;
          print("lower future");
          print(x);
        });
      } catch (err) {
        print(err);
      }
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
              return new ProfilePage();
              // );
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
    print(widget.x);
    if(widget.x){
      setState(() {
        print(widget.saved);
        firstlore=widget.saved;
      });
    }
    if (!widget.x) {
      print(firstlore);
      return AnimatedSplashScreen(
        nextScreen: HomeScreen(
          x: true,
          saved: firstlore,
        ),
        splash: Image.asset("assets/images/emotion.png"),
        splashTransition: SplashTransition.rotationTransition,
        duration: 5000,
        backgroundColor: Color(0xff392850),
      );
    }

    return Center(
      child: GestureDetector(
        onVerticalDragDown: (details) {
          r = rnd.nextInt(max - min);
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
        //  ,  
        backgroundColor: Color(0xff392850),
          
          
          appBar: !_visible?new AppBar(backgroundColor:Colors.transparent , elevation: 0.0,) : AppBar(
            brightness: Brightness.light,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                TextButton(
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
                          color: Colors.white,
                          fontSize: x,
                          fontWeight: FontWeight.w900)),
                ),
                TextButton(
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
                  child: Text("  Search",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: y,
                          fontWeight: FontWeight.w900)),
                )
              ],
            ),
            actions: [],
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            //  /height: 500,
            child: GridView.builder(
                itemCount: firstlength,
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 3 : 6,
                    childAspectRatio: 0.58),
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
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 40,), label: "Home"),

          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,size: 40,), label: "Favorite"),

          BottomNavigationBarItem(
              icon: Icon(Icons.border_color,size: 40,), label: "write"),

          BottomNavigationBarItem(icon: Icon(Icons.person,size: 40,), label: "Profile"),

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
            TextButton(
              onPressed: () {
                if (homechecking == 1) {
                  x = 22;
                  y = 15;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      homechecking = 0;
                      return HomeScreen(
                        x: true,
                        saved: firstlore,
                      );
                    }),
                  );
                }
                ;
              },
              child: Text("Home",
                  style: TextStyle(
                      color: Colors.white54,
                      fontSize: x,
                      fontWeight: FontWeight.w900)),
            ),
            TextButton(
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
              child: Text(" Search",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: y,
                      fontWeight: FontWeight.w900)),
            ),
          ],
        ),
        actions: [],
      ),
    );
  }
}
