import 'package:flutter/material.dart';
import 'package:roohi_sample/core/constants/colors.dart';

class AppStyles {

  TextStyle styleText_32_700() {
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: cTextPrimary,
      fontFamily: 'Poppins',
    );
  }



  TextStyle styleText_14_600() {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: cTextPrimary,
      fontFamily: 'Poppins',
    );
  }

  TextStyle styleText_12_500() {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: cTextSecondary,
      fontFamily: 'Poppins',
    );
  }

  TextStyle styleText_11_500() {
    return const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      color: cTextTertiary,
      fontFamily: 'Poppins',
    );
  }
}
