import 'dart:ui';

import 'package:algoriza_weather/core/model/Location.dart';
import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:algoriza_weather/features/home/presentation/widgets/cards/current_card_widget.dart';
import 'package:algoriza_weather/features/home/presentation/widgets/cards/sun_card.dart';
import 'package:algoriza_weather/features/home/presentation/widgets/cards/week_card/week_card.dart';
import 'package:algoriza_weather/features/widgets/drawer_widget.dart';
import 'package:algoriza_weather/features/widgets/text_widget.dart';
import 'package:algoriza_weather/features/widgets/today_weather_card.dart';
import 'package:algoriza_weather/features/home/presentation/widgets/appbar/weather_appbar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  late ScrollController _scrollController;
  bool _appBarCollapsed = false;

  bool isShrink() {
    return _scrollController.hasClients && _scrollController.offset > (230 - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (isShrink() && !_appBarCollapsed) {
          setState(() => _appBarCollapsed = true);
        } else if (!isShrink() && _appBarCollapsed) {
          setState(() => _appBarCollapsed = false);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    // convert dateTime.now to local then split
    var dateZone = DateTime.now().toLocal();
    var dateFormat = DateFormat("H").format(dateZone.toLocal());
    int dateSplit = int.parse(dateFormat);

    var cubit = AppBloc.get(context);
    cubit.setSunsetSunrise();

    List<Widget> widgetsList = [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SunCard(),
            SizedBox(height: 10),
            CurrentCardWidget(),
            SizedBox(height: 10),
            TodayWeatherCard(),
            SizedBox(height: 10),
            WeekCard(),
          ],
        ),
      )
    ];

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const DrawerWidget(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    dateSplit >= cubit.sunrise && dateSplit < cubit.sunset
                        ? 'assets/images/day2.png'
                        : 'assets/images/night2.png',
                  ),
                  fit: BoxFit.fill),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: ConditionalBuilder(
                  condition: cubit.forecastWeather != null,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) => CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      WeatherAppBar(isShrink: _appBarCollapsed, cubit: cubit),
                      SliverList(
                        delegate: SliverChildListDelegate(widgetsList),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
