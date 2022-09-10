import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageLocationsWidgets extends StatelessWidget {
  const ManageLocationsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc cubit = AppBloc.get(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  child: TextField(
                    controller: cubit.nameCityController,
                    onChanged: (value) {
                      cubit.SearchCity = value;
                      cubit.getSearch();
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      suffix: const Icon(
                        Icons.search,
                      ),
                      hintText: 'Search'.toUpperCase(),
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
                  height: 200,
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
              cubit.AddLocations(cubit.searchedForecast!.location.name, cubit.searchedForecast!.current.temp_c);
              print(cubit.searchedForecast!.current.temp_c);
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
