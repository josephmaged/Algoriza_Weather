import 'package:algoriza_weather/core/model/Hour.dart';
import 'package:algoriza_weather/features/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class TodayWeatherItem extends StatelessWidget {
  final Hour item;

  const TodayWeatherItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.time.split(' ').last.split(':').first == '00'
                ? '12Am'
                : item.time.split(' ').last.split(':').first.substring(0, 1) == '0'
                    ? "${item.time.split(' ').last.split(':').first.split('0').last}AM"
                    : int.parse(item.time.split(' ').last.split(':').first) > 12
                        ? "${(int.parse(item.time.split(' ').last.split(':').first) - 12)}Pm"
                        : int.parse(item.time.split(' ').last.split(':').first) == 12
                            ? "${item.time.split(' ').last.split(':').first}Pm"
                            : "${item.time.split(' ').last.split(':').first}Am",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          CloudImageWidget(
            lCloudImage: "http:${item.condition.icon}",
          ),
          Text(
            '${item.tempC.toString().split('.').first}\u2103',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
