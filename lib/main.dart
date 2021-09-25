import 'package:country_code_picker/country_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/view/AuthScreens/verify_screen.dart';
import 'package:test/view/HomeScreens/CardScreen.dart';
import 'package:test/view/middelPage.dart';
import 'package:test/viewmodels/view_model_provider.dart';
import 'package:test/widgets/theam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: AuthProvider(),
      child: MaterialApp(
        localizationsDelegates: [
          CountryLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: Styles.themeData(context),
        home: MiddelPage(),
        routes: {
          VerifyScreen.routeArgs: (ctx) => VerifyScreen(),
          CardScreen.routeArgs: (ctx) => CardScreen(),
        },
      ),
    );
  }
}
