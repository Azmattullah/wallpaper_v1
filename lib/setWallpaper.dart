import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';


class SetWall extends StatefulWidget {
  @override
  _SetWallState createState() => _SetWallState();
}

class _SetWallState extends State<SetWall> {
  Future<void> setWallpaper() async {
    try {
      String url = "https://source.unsplash.com/random";
      int location = WallpaperManager.BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      final bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => {setWallpaper()},
                child: Text("Set Random Wallpaper")),
          ],
        ),
      ),
      ),
    );
  }
}

