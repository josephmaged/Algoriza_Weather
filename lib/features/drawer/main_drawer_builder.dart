import 'package:algoriza_weather/app/helpers/cash_helper.dart';
import 'package:algoriza_weather/config/const/styles_manager.dart';
import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/core/util/bloc/app/states.dart';
import 'package:algoriza_weather/features/drawer/drawer_tag.dart';
import 'package:algoriza_weather/features/drawer/weather_tag.dart';
import 'package:algoriza_weather/features/manage_locations/pages/manage_locations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dotted_divider.dart';

class BuildMenu extends StatelessWidget {
  const BuildMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBloc cubit = AppBloc.get(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Card(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(20))),
          color: const Color.fromRGBO(49, 60, 70, 1),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width - 30,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(children: [
                /*const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    )),*/
                const DrawerTag(
                  iconData: Icons.star,
                  text: "Favourite Locations",
                  prephralIcon: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
                WeatherTag(
                  iconData: Icons.pin_drop_sharp,
                  text: cubit.forecastWeather!.location.name,
                  temp: cubit.forecastWeather!.current.temp_c.toString().split('.').first,
                ),
                const DottedDivider(),
                const DrawerTag(
                    //*Others
                    iconData: Icons.location_on_outlined,
                    text: "Other Locations"),
                Column(
                  children: List.generate(
                          cubit.locations.length,
                          (index) => WeatherTag(
                            text: cubit.locations[index],
                            temp: cubit.temps[index],
                          ),
                        ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(79, 87, 98, 1),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ManageLocations()));
                    },
                    child: Text(
                      "Manage Location",
                      style: getRegularStyle(),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
