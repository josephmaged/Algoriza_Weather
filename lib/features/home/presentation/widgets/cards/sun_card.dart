import 'package:algoriza_weather/config/const/strings.dart';
import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:algoriza_weather/features/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SunCard extends StatelessWidget {
  const SunCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppBloc.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 1,
                color: Colors.white.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const TextWidget(
                            text: 'Sunrise',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            text: cubit.forecastWeather!.forecast.forecastday.first.astro.sunrise.toString(),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(lightSunrise),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const TextWidget(
                            text: 'Sunset',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            text: cubit.forecastWeather!.forecast.forecastday.first.astro.sunset.toString(),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: Image.asset(lightSunset),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
