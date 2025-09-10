import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';

void customToastBar({
  required BuildContext context,
  required String message,
  required IconData icon,
  required Color backgroundColor,
  required Color textColor,
  required DelightSnackbarPosition postion,
}) {
  return DelightToastBar(
    builder: (context) {
      return ToastCard(
        color: backgroundColor,
        leading: Icon(icon, size: 30, color: textColor),
        title: Text(
          message,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      );
    },
    position: postion,
    autoDismiss: true,
    animationDuration: Duration(milliseconds: 900),
  ).show(context);
}
