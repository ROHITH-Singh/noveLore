import 'package:novel/screens/home/home.dart';
import 'package:novel/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:novel/models/user.dart';
import 'package:novel/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FBUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: WelcomeScreen(),
      ),
    );
  }
}
