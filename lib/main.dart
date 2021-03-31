import 'package:flutter/material.dart';
import 'package:flutter_testing/model/favorites.dart';
import 'package:flutter_testing/model/login.dart';
import 'package:flutter_testing/screen/favorite.dart';
import 'package:flutter_testing/screen/first_page.dart';
import 'package:flutter_testing/screen/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(TestingApp());
}

class TestingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Favorites>(create: (context) => Favorites()),
        ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          FirstPage.routeName: (context) => FirstPage(),
          HomePage.routeName: (context) => HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
        },
        initialRoute: FirstPage.routeName,
      ),
    );
  }
}
