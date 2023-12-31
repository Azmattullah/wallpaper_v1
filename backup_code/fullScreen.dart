import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullScreen extends StatelessWidget {
  String imgUrl;
  FullScreen({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          
        },
        child: Text("Set Wallpaper")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
