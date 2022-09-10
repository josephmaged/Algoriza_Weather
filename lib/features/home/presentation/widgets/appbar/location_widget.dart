import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
    required this.isShrink
  }) : super(key: key);

  final bool isShrink;

  @override
  Widget build(BuildContext context) {
    AppBloc cubit = AppBloc.get(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "${toBeginningOfSentenceCase(cubit.forecastWeather?.location.name)}",
              style: isShrink ? const TextStyle(fontSize: 34) : const TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }
}
