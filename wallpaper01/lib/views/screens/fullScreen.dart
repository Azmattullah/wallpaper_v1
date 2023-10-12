import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:wallpaper01/assets/colors.dart';

// ignore: must_be_immutable
class FullScreen extends StatefulWidget {
  String imgUrl;
  FullScreen({super.key, required this.imgUrl});
  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  Future<void> setWallpaper() async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Your wallpaper has been applied.")));
      String url = widget.imgUrl;
      int location = WallpaperManager.BOTH_SCREEN;
      // int location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException catch (error) {
      print(error);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error Occured - $error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(30.0), // Set the desired borderRadius
          child: Container(
            height: 40, // Set the desired height
            width: 140, // Set the desired width
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: CustomColors.neonColor, // background (button) color
                onPrimary: Colors.white, // text color
              ),
              onPressed: () => {setWallpaper()},
              child: Text(
                "Set Wallpaper",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.imgUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
