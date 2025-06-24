import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:in_app_notification/in_app_notification.dart';




DynamicMessagesage(String Message, String icon, bool color,BuildContext context) {
  InAppNotification.show(
    duration: Duration(seconds: 3),
    child: Padding(
      padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          // color: color,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                color == true
                    ?  Success.withOpacity(0.4)
                    :  Neutrals.withOpacity(0.4),
                color == true
                    ?  Success.withOpacity(0.7)
                    :  ErrorColor.withOpacity(0.8),
                color == true
                    ?  Success
                    :  ErrorColor,
              ],
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                  child: SvgPicture.asset(
                    "$icon",
                    height: 40,
                    width: 40,
                    color: White,
                  ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$Message",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    context: context,
    onTap: () => print('Notification tapped!'),
  );
}