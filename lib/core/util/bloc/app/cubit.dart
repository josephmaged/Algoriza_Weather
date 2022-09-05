import 'package:algoriza_weather/core/model/ForecastWeather.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:algoriza_weather/core/util/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  String initialValue = 'cairo';
  ForecastWeather? forecastWeather;/*
  Location? location;
  Current? current;
  Forecast? forecast;*/

  void getForecastWeather() async {
    emit(AppGetForecastData());
    DioHelper.getForecastData(
      url: 'forecast.json',
      query: {
        'key': 'ef14efec4be84961856162527220509',
        'q': initialValue,
        'days': 6,
        'aqi': 'yes',
        'alerts': 'no',
      },
    ).then((value) {
      forecastWeather = ForecastWeather.fromJson(value.data);
      emit(AppSucceedGetForecastData());
    });
  }
}
