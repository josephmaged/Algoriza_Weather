import 'package:algoriza_weather/features/home/presentation/widgets/appbar/condition_text.dart';
import 'package:algoriza_weather/features/home/presentation/widgets/appbar/feels_like_text.dart';
import 'package:algoriza_weather/features/home/presentation/widgets/appbar/high_low_text.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.isShrink,
  }) : super(key: key);

  final bool isShrink;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConditionText(isShrink: isShrink,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HighLowText(isShrink: isShrink),
            isShrink ? Container() : const FeelsLikeText(),
          ],
        ),
      ],
    );
  }
}
