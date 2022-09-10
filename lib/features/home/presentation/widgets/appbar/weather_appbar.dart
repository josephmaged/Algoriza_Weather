import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/features/home/presentation/widgets/appbar/main_flex_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({
    Key? key,
    required this.isShrink,
    required this.cubit,
  }) : super(key: key);

  final bool isShrink;
  final AppBloc cubit;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: isShrink
          ? Hero(
              tag: "Location",
              child: Text(
                "${cubit.forecastWeather?.location.name}",
              ),
            )
          : null,
      backgroundColor: isShrink ? Colors.black87 : Colors.transparent,
      pinned: true,
      expandedHeight: 300,
      collapsedHeight: 170,
      flexibleSpace: _buildFlexibleSpaceBar(),
    );
  }

  FlexibleSpaceBar _buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      expandedTitleScale: 1.2,
      collapseMode: CollapseMode.none,
      titlePadding: EdgeInsets.only(top: isShrink ? 0 : 20, right: 20, left: 20),
      title: FlexMainWidget(cubit: cubit, isShrink: isShrink),
    );
  }
}
