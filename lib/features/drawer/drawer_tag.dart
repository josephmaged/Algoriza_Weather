import 'package:my_weather/config/const/font_manager.dart';
import 'package:my_weather/config/const/styles_manager.dart';
import 'package:my_weather/config/const/values_manager.dart';
import 'package:flutter/material.dart';
class DrawerTag extends StatelessWidget {
  final IconData iconData;
  final Icon? prephralIcon;
  final String text;

  const DrawerTag(
      {Key? key, required this.iconData, required this.text, this.prephralIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: getRegularStyle(fontSize: FontSize.s16),
          ),
          Spacer(),
          if (prephralIcon != null) prephralIcon!
        ],
      ),
    );
  }
}