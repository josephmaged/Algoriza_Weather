import 'dart:ui';

import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ManageLocationsWidgets extends StatelessWidget {
  const ManageLocationsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // convert dateTime.now to local then split
    var dateZone = DateTime.now().toLocal();
    var dateFormat = DateFormat("H").format(dateZone.toLocal());
    int dateSplit = int.parse(dateFormat);

    AppBloc cubit = AppBloc.get(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: TextField(
                          controller: cubit.nameCityController,
                          onChanged: (value) {
                            cubit.SearchCity = value;
                            cubit.getSearch();
                          },
                          style: const TextStyle(
                              fontSize: 20
                          ),
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                              fontSize: 20
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: ConditionalBuilder(
                          condition: state is! AppGetSearchData,
                          builder: (context) => ListView.separated(
                            itemBuilder: (context, index) => getCountry(cubit.name),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 20.0,
                            ),
                            itemCount: 1,
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                      )
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

Widget getCountry(String item) => BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppBloc.get(context);
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              cubit.getSearch();
              cubit.nameCityController.clear();
              cubit.name= '';
              cubit.AddLocations(cubit.searchedForecast!.location.name, cubit.searchedForecast!.current.temp_c);
              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
