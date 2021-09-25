import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/utils/string.dart';
import 'package:test/view/AuthScreens/loginscreen.dart';
import 'package:test/view/HomeScreens/CardScreen.dart';

class MiddelPage extends StatelessWidget {
  const MiddelPage({Key? key}) : super(key: key);
    static const routeArgs = '/middel-page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshort) {
              if (snapshort.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.black,),
                );
              } else if (snapshort.hasData) {
                return CardScreen();
              } else if (snapshort.hasError) {
                return Text(s_w_w);
              } else {
                return Center(
                  child: AuthScreen(),
                );
              }
            }),
      ),
    );
  }
}
