import 'package:algoriza_weather/core/model/ForecastWeather.dart';
import 'package:algoriza_weather/core/model/Forecastday.dart';
import 'package:algoriza_weather/core/model/Hour.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:algoriza_weather/core/util/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  String initialValue = 'cairo';
  ForecastWeather? forecastWeather;
  int sunset = 0;
  int sunrise = 0;
  List<Hour> hours = [];
  List<Forecastday> forecastday = [];

  void getForecastWeather() async {
    emit(AppGetForecastData());
    await DioHelper.getForecastData(
      url: 'forecast.json',
      query: {
        'key': 'ef14efec4be84961856162527220509',
        'q': initialValue,
        'days': 6,
        'aqi': 'yes',
        'alerts': 'no',
      },
    ).then((value) async {
      forecastWeather = ForecastWeather.fromJson(value.data);
      hours = forecastWeather!.forecast.forecastday[0].hour;
      forecastday = forecastWeather!.forecast.forecastday;
      setSunsetSunrise();
      emit(AppSucceedGetForecastData());
    });
  }


  void setSunsetSunrise() async {
    DateTime sunriseDate = forecastWeather != null
        ? DateFormat("jm").parse(forecastWeather!.forecast.forecastday.first.astro.sunrise)
        : DateTime.now();
    sunrise = sunriseDate.hour;
    DateTime sunsetDate = forecastWeather != null
        ? DateFormat("jm").parse(forecastWeather!.forecast.forecastday.first.astro.sunset)
        : DateTime.now();
    sunset = sunsetDate.hour;
  }
}
