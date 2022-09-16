import 'package:my_weather/core/model/Forecastday.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekCardItem extends StatelessWidget {
  final Forecastday forecastday;

  const WeekCardItem({Key? key, required this.forecastday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime format = DateFormat("yyyy-MM-dd").parse(forecastday.date);
    String day = DateFormat.EEEE().format(format);
    return Row(
      children: [
        Text(day),
        const Spacer(),
        const Icon(
          Icons.water_drop_sharp,
          color: Colors.blue,
        ),
        Text(
          forecastday.day.avghumidity.toString().split('.').first + "%",
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          forecastday.day.maxtempC.toString().split('.').first + "°",
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          forecastday.day.mintempC.toString().split('.').first + "°",
        ),
      ],
    );
  }
}
