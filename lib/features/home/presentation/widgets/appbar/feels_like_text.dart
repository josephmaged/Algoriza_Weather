import 'package:my_weather/core/util/bloc/app/cubit.dart';
import 'package:flutter/material.dart';

class FeelsLikeText extends StatelessWidget {
  const FeelsLikeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc cubit = AppBloc.get(context);
    return Text(
      ' Feels like ${cubit.forecastWeather!.current.feelslike_c.toString().split(".").first}°',
      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
    );
  }
}
