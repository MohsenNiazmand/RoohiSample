import 'package:flutter/material.dart';
import 'package:roohi_sample/core/constants/colors.dart';
import 'package:roohi_sample/core/constants/dimentions.dart';

class FormConstants {
  static OutlineInputBorder defaultBorder(BuildContext context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(dimen4),
        borderSide: const BorderSide(
          color: cGrey,
        ),
      );

  static OutlineInputBorder errorBorder(BuildContext context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(dimen4),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 2,
        ),
      );

  static UnderlineInputBorder errorBorderUnderline(BuildContext context) =>
      UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 2,
        ),
      );

  static OutlineInputBorder focusBorder(BuildContext context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(dimen4),
        borderSide: const BorderSide(
          color: cTextTertiary,
        ),
      );
}
