import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:flutter/material.dart';

class ConditionText extends StatelessWidget {
  const ConditionText({
    Key? key,
    required this.isShrink,
  }) : super(key: key);

  final bool isShrink;

  @override
  Widget build(BuildContext context) {
    var cubit = AppBloc.get(context);

    return Text(
      cubit.forecastWeather!.current.condition.text,
      style: !isShrink
          ? Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}
