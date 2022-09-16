import 'package:my_weather/core/model/ForecastWeather.dart';
import 'package:my_weather/core/model/Hour.dart';
import 'package:my_weather/core/util/bloc/app/cubit.dart';
import 'package:my_weather/core/util/bloc/app/states.dart';
import 'package:my_weather/features/widgets/text_widget.dart';
import 'package:my_weather/features/widgets/today_weather_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TodayWeatherCard extends StatelessWidget {
  const TodayWeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        var cubit = AppBloc.get(context);

        /*List<Hour> hours = cubit.hours
            .where((element) =>
                DateFormat.H().format(DateTime.fromMicrosecondsSinceEpoch(element.timeEpoch).toLocal()) == DateFormat.H().format(DateTime.now()))
            .toList();
        print(hours);*/

        return SizedBox(
          width: double.infinity,
          child: Card(
            elevation: 1,
            color: Colors.white.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: 'Hourly Forecast',
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 120,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => TodayWeatherItem(item: cubit.hours[index]),
                      itemCount: cubit.hours.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
