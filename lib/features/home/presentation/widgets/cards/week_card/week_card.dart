import 'package:algoriza_weather/core/model/Forecastday.dart';
import 'package:algoriza_weather/core/util/bloc/app/cubit.dart';
import 'package:algoriza_weather/features/home/presentation/widgets/cards/week_card/week_card_item.dart';
import 'package:algoriza_weather/features/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekCard extends StatelessWidget {
  const WeekCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppBloc.get(context);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: 'Week Forecast',
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
              const SizedBox(height: 16),
              Column(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: WeekCardItem(
                     forecastday: cubit.forecastday[index]
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
