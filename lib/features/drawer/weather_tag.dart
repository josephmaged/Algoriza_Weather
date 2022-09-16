import 'package:algoriza_weather/app/helpers/cash_helper.dart';
import 'package:algoriza_weather/config/const/font_manager.dart';
import 'package:algoriza_weather/config/const/styles_manager.dart';
import 'package:algoriza_weather/config/const/values_manager.dart';
import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WeatherTag extends StatelessWidget {
  final IconData? iconData;
  final String? temp;
  final String text;

  const WeatherTag({Key? key, this.iconData, required this.text, this.temp}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var snackBar = SnackBar(content: Text('${text} deleted successfully') );
    AppBloc cubit = AppBloc.get(context);
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails drag) {
        cubit.locations.removeWhere((element) => element == text);
        cubit.temps.removeWhere((element) => element == temp);

        CashHelper.setData(key: "locations", value: cubit.locations);
        CashHelper.setData(key: "temps", value: cubit.temps);

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 50,
            ),
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
                  temp!.split('.').first  + "°",
                  style: getRegularStyle(fontSize: FontSize.s14),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
