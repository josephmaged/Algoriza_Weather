import 'package:my_weather/core/util/bloc/app/cubit.dart';
import 'package:my_weather/features/home/presentation/widgets/appbar/location_widget.dart';
import 'package:my_weather/features/home/presentation/widgets/appbar/body_widget.dart';
import 'package:my_weather/features/home/presentation/widgets/appbar/current_temperature_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlexMainWidget extends StatelessWidget {
  const FlexMainWidget({
    Key? key,
    required this.cubit,
    required this.isShrink,
  }) : super(key: key);

  final AppBloc cubit;
  final bool isShrink;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isShrink ? const Spacer(flex: 2) : const Spacer(flex: 7),
          CurrentTemperatureWidget(isShrink: isShrink),
          isShrink ? Container() : Hero(tag: "Location", child: LocationWidget(isShrink: isShrink)),
          isShrink ? Container() : const Spacer(flex: 1),
          isShrink ? Container() : BodyWidget(isShrink: isShrink),
          isShrink ? const Spacer() : const Spacer(flex: 3),
        ],
      ),
    );
  }
}
