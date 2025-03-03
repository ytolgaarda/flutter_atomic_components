import 'package:flutter/material.dart';
part 'type.dart';

class GenericSnakbar {
  static void show({
    required BuildContext context,
    required SnackBarType type,
    String? message,
    Duration duration = const Duration(seconds: 3),
    Widget? content,
  }) {
    Color backgroundColor;
    FontWeight fontWeight = FontWeight.w500;
    String messageText;

    switch (type) {
      case SnackBarType.alert:
        backgroundColor = Colors.amber;
        messageText = message ?? '..';
        break;
      case SnackBarType.error:
        backgroundColor = Colors.red;
        messageText = message ?? '..';
        fontWeight = FontWeight.normal;
        break;
      case SnackBarType.success:
        backgroundColor = Colors.green;
        fontWeight = FontWeight.normal;
        messageText = message ?? 'İşleminiz gerçekleştirildi';
        break;
    }
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (content != null) content,
          Flexible(
            child: Text(
              messageText,
              style: TextStyle(
                fontWeight: fontWeight,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      padding: EdgeInsets.all(16.0),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      duration: duration,
    );

    /// Show
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
