import 'package:flutter/material.dart';
import 'package:wallpaper01/assets/colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  String word1;
  String word2;
  CustomAppBar({super.key, required this.word1, required this.word2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: word1,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 38,
                  fontWeight: FontWeight.w600)),
          TextSpan(
            text: word2,
            style: TextStyle(
                color: CustomColors.neonColor,
                fontSize: 38,
                fontWeight: FontWeight.w600),
          ),
        ]),
      ),
    );
  }
}
