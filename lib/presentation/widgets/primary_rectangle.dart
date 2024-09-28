import 'package:flutter/material.dart';

class PrimaryRectangle extends StatelessWidget {
  const PrimaryRectangle({
    super.key,
    this.color = Colors.white,
    this.width,
    this.height,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.radius = 0,
    this.child = const SizedBox(),
    this.borderWith = 0,
    this.borderColor = const Color(0x1F000000),
    this.shadowRadius = 0,
    this.shadowColor = const Color(0x1F000000),
    this.shadowOffset = Offset.zero,
    this.onTap,
    this.onDoubleTap,
    this.gradient,
    this.customRadius,
  });

  final Color color;

  final double? width;

  final double? height;

  final EdgeInsetsGeometry padding;

  final EdgeInsetsGeometry margin;

  final double radius;

  final Widget child;

  final double borderWith;

  final Color borderColor;

  final double shadowRadius;

  final Color shadowColor;

  final Offset shadowOffset;

  final Gradient? gradient;

  final Function()? onTap;

  final Function()? onDoubleTap;

  final BorderRadiusGeometry? customRadius;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: Material(
          borderRadius: customRadius ?? BorderRadius.circular(radius),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            borderRadius: BorderRadius.circular(radius),
            child: Padding(
              padding: margin,
              child: Ink(
                width: width,
                height: height,
                padding: padding,
                decoration: BoxDecoration(
                  border: borderWith > 0
                      ? Border.all(color: borderColor, width: borderWith)
                      : null,
                  color: color,
                  gradient: gradient,
                  borderRadius: customRadius ?? BorderRadius.circular(radius),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: shadowRadius,
                      color: shadowColor,
                      offset: shadowOffset,
                    ),
                  ],
                ),
                child: child,
              ),
            ),
          ),
        ),
      );
}
