import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class OnBoarding extends StatelessWidget {
  String? headerText;
  String? subText;
  String? img;

  OnBoarding({Key? key, required this.headerText, required this.subText, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20,left: 20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Lottie.asset(
                img!,
                width: MediaQuery.of(context).size.width - 50,
              ),
            ),
            Text(
              headerText!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
