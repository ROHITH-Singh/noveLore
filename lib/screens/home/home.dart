import 'package:flutter/material.dart';
import 'package:novel/consttants.dart';
import 'package:novel/screens/home_screen.dart';
import 'package:novel/widgets/Round_buttons.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Novel Core',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      
      home: WelcomeScreen(),
      // This makes the visual density adapt to the platform that you run
      // the app on. For desktop platforms, the controls will be smaller and
      // closer together (more dense) than on mobile platforms.
      // visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Color(0xff392850),
        body: Container(
          width: double.infinity,

          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [

          //       Color(0xff392850),

          //     ],
          //   ),
          //   // image: DecorationImage(
          //   //     image: AssetImage("assets/images/Bitmap.png"),
          //   //     fit: BoxFit.fill),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/NoveLore.png")),
              // RichText(
              //   text: TextSpan(
              //     style: Theme.of(context).textTheme.headline2,
              //     children: [

              //       // TextSpan(
              //       //     text: "Novel",
              //       //     style: Theme.of(context).textTheme.headline2),
              //       // TextSpan(
              //       //   text: "ore.",
              //       //   style: TextStyle(fontWeight: FontWeight.bold),
              //       // ),
              //     ],
              //   ),
              // ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: RoundButton(
                    text: "start reading",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen(x: false,);
                          },
                        ),
                      );
                    },
                    fontSize: 20,
                  ))
            ],
          ),
        ),
      ),
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.amberAccent[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            title: Text(
              " do u wanna exit nadded to library",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff392850),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('no'),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
