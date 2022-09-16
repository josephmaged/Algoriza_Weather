import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:flutter/material.dart';

class HighLowText extends StatelessWidget {
  const HighLowText({
    Key? key,
    required this.isShrink,
  }) : super(key: key);

  final bool isShrink;

  @override
  Widget build(BuildContext context) {
    AppBloc cubit = AppBloc.get(context);
    return Text(
        '${cubit.forecastWeather!.forecast.forecastday[0].day.maxtempC.toString().split('.').first}° / ${cubit.forecastWeather!.forecast.forecastday[0].day.mintempC.toString().split('.').first}°',
        style: !isShrink
            ? Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
            : Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16, color: Colors.white));
  }
}
