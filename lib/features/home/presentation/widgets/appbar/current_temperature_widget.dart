import 'package:my_weather/core/util/bloc/app/cubit.dart';
import 'package:my_weather/features/home/presentation/widgets/appbar/high_low_text.dart';
import 'package:flutter/material.dart';

class CurrentTemperatureWidget extends StatelessWidget {
  const CurrentTemperatureWidget({
    Key? key,
    required this.isShrink,
  }) : super(key: key);

  final bool isShrink;

  @override
  Widget build(BuildContext context) {
    AppBloc cubit = AppBloc.get(context);
    return Row(
      children: [
        Text('${cubit.forecastWeather!.current.temp_c.toString().split('.').first}°',
            style: const TextStyle(fontSize: 60)),
        const Spacer(flex: 1),
        isShrink
            ? HighLowText(isShrink: isShrink)
            : Container(),
        const Spacer(flex: 3),
        Image.network("http:${cubit.forecastWeather!.current.condition.icon}",scale: 0.7,)
      ],
    );
  }
}
