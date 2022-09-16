import 'dart:io';

import 'package:my_weather/app/helpers/cash_helper.dart';
import 'package:my_weather/core/util/bloc/app/cubit.dart';
import 'package:my_weather/core/util/network/dio_helper.dart';
import 'package:my_weather/features/home/presentation/pages/home_page.dart';
import 'package:my_weather/features/on_boarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

bool? initScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CashHelper.initCashHelper();
  final List<String> mylocations = CashHelper.getData("locations") ?? const [];
  final List<String> myTemps = CashHelper.getData("temps") ?? const [];
  HttpOverrides.global = new MyHttpOverrides();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getBool("showHome");

  runApp(MyApp(locations: mylocations, temps: myTemps,));
}

class MyApp extends StatelessWidget {
  final List<String>? locations;
  final List<String>? temps;

  const MyApp({Key? key, required this.locations,required this.temps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(locations: locations!,temps: temps!)..getForecastWeather()..setSunsetSunrise(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: initScreen == true ? const HomePage() : const OnBoardingPage(),
      ),
    );
  }
}
