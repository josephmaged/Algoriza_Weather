import 'package:my_weather/app/helpers/cash_helper.dart';
import 'package:my_weather/config/const/font_manager.dart';
import 'package:my_weather/config/const/styles_manager.dart';
import 'package:my_weather/config/const/values_manager.dart';
import 'package:my_weather/core/util/bloc/app/cubit.dart';
import 'package:my_weather/core/util/bloc/app/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class WeatherTag extends StatelessWidget {
  final IconData? iconData;
  final String? temp;
  final String text;

  const WeatherTag({Key? key, this.iconData, required this.text, this.temp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var snackBar = SnackBar(content: Text('${text} deleted successfully'));
    AppBloc cubit = AppBloc.get(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Slidable(
          endActionPane: ActionPane(
            motion: BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  cubit.RemoveLocations(text, temp);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                borderRadius: BorderRadius.circular(10),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconData != null)
                  Icon(
                    iconData,
                    color: Colors.white,
                    size: AppSize.s12,
                  ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  text,
                  style: getRegularStyle(fontSize: FontSize.s16),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Colors.amber,
                      size: AppSize.s12,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      temp!.split('.').first + "°",
                      style: getRegularStyle(fontSize: FontSize.s14),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
