import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:algoriza_weather/features/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentCardWidget extends StatelessWidget {
  const CurrentCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppBloc.get(context);

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextWidget(
                        text: 'Feels like',
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: "${cubit.forecastWeather!.current.feelslike_c.toString().split('.').first}°",
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextWidget(
                        text: 'Wind',
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: "${cubit.forecastWeather!.current.wind_mph.toString().split('.').first}mph",
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextWidget(
                        text: 'Humidity',
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: "${cubit.forecastWeather!.current.humidity.toString().split('.').first}%",
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const TextWidget(
                        text: 'Pressure',
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: "${cubit.forecastWeather!.current.pressure_in.toString().split('.').first}inHg",
                        fontSize: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
