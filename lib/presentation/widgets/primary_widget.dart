import 'package:flutter/material.dart';
import 'package:roohi_sample/core/constants/colors.dart';
import 'package:roohi_sample/core/constants/dimentions.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPress, required this.text,super.key,
  });

  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: cGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(dimen4),
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: cWhite,
        ),
      ),
    );
  }
}