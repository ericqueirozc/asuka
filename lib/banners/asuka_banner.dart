import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

class AsukaBanner extends MaterialBanner {
  AsukaBanner._(
    Key? key,
    String content, {
    IconData? icon,
    List<Widget>? actions,
    Color? backgroundColor,
  }) : super(
          content: Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 20,
                  color: Colors.black45,
                ),
                SizedBox(width: 10)
              ],
              Expanded(
                child: Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          actions: actions ??
              [
                InkWell(
                  child: Icon(Icons.close, color: Colors.white),
                  onTap: asuka.hideCurrentMaterialBanner,
                )
              ],
          backgroundColor: backgroundColor,
        );

  factory AsukaBanner.warning(String message, {Key? key}) =>
      AsukaBanner._(key, message,
          backgroundColor: Color(0xFFE6CA72), icon: Icons.warning);

  factory AsukaBanner.alert(String message, {Key? key}) =>
      AsukaBanner._(key, message,
          backgroundColor: Color(0xffFA5456), icon: Icons.report);

  factory AsukaBanner.info(String message, {Key? key}) =>
      AsukaBanner._(key, message,
          backgroundColor: Color(0xff3196DA), icon: Icons.help);

  factory AsukaBanner.success(String message, {Key? key}) =>
      AsukaBanner._(key, message,
          backgroundColor: Color(0xFF80AD49), icon: Icons.check_circle);

  factory AsukaBanner.message(String message, {Key? key}) =>
      AsukaBanner._(key, message, backgroundColor: Color(0xff484848));

  void show() => asuka.showMaterialBanner(this);
}
