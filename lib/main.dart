import 'package:flutter/services.dart';
import 'package:novel/screens/home/home.dart';
import 'package:flutter/material.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  // SystemChrome.setEnabledSystemUIOverlays([]);
//  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Color(0xff392850), //or set color with: Color(0xFF0000FF)
));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: WelcomeScreen(),
      
    );
  }
}
