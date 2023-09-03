import 'package:flutter/material.dart';

import '../../util/utils.dart';

Widget customButton(
    {required String buttonText,
      required Color buttonColor,
      required Color textColor,
      required Function onButtonClick}) =>
    ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      onPressed: onButtonClick(),
      child: Text(
        buttonText,
        style: defaultTestStyle.copyWith(color: textColor),
      ),
    );
