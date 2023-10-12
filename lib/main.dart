import 'package:flutter/material.dart';
// import 'package:wallpaper01/views/screens/home.dart';
import 'package:wallpaper01/views/screens/splashScreen.dart';
// import 'package:wallpaper01/views/screens/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplasScreen(),
      // home: HomeScreen(),
    );
  }
}
