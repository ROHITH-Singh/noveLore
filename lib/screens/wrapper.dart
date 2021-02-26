import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:novel/Profilescreen.dart';
import 'package:novel/screens/home/home.dart';
import 'package:novel/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:novel/models/user.dart';

import '../constants.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FBUser>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      print("hello");
      print(user);
      return Authenticate();
    } else {
      String uid = user.uid;
      
      return ThemeProvider(
          initTheme: kDarkTheme,
          child: Builder(builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeProvider.of(context),
              home: ProfileScreen(),
            );
          }));
    }
  }
}
