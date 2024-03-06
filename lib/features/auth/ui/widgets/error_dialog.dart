import 'package:flutter/material.dart';
import 'package:new_corse_project/core/helpers/extenions.dart';
import 'package:new_corse_project/core/themes/custom_text_style.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.content, required this.context});
  final String content;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        content,
        style: CustomTextStyle.font15DarkBlueMediun,
      ),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Got It",
              style: CustomTextStyle.font14BlueSemiBold,
            ))
      ],
    );
  }
}
