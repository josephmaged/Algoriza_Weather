import 'package:my_weather/core/util/bloc/app/cubit.dart';
import 'package:flutter/material.dart';
class CloudImageWidget extends StatelessWidget {
  final String lCloudImage;
  final double height;
  final double width;
  const CloudImageWidget({
    Key? key,
    required this.lCloudImage,
    this.height = 50,
    this.width = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppBloc cubit = AppBloc.get(context);
        return SizedBox(
          height: height,
          width: height,
          child:Image.network(lCloudImage),
        );
      }
    );
  }
}
