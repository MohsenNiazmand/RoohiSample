// ignore_for_file: no_default_cases

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roohi_sample/core/constants/colors.dart';


enum ToastType {  success,  }

class PrimaryToast {
  static CancelFunc? cancelFunc;

  static void show(String? text, {ToastType type = ToastType.success}) {
    if (cancelFunc != null) {
      cancelFunc!.call();
    }
    cancelFunc = BotToast.showCustomText(
      duration: getDuration(text),
      align: Alignment.bottomRight,
      toastBuilder: (_) => Builder(builder: (BuildContext context) {
        late Color background;
        late Color textColor;
        late Color iconColor;
        late Widget icon;

            background = cGreen50;
            textColor = cGreen700;
            iconColor = cGreen500;


        return GestureDetector(
          onTap: getDuration(text).inMilliseconds > 3000
              ? () {
                  if (cancelFunc != null) {
                    cancelFunc!.call();
                  }
                }
              : null,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:Border.all(color: iconColor,width: 1),
              color: background,
            ),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.check_circle_outline_rounded,color: iconColor,),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            text ?? '',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor,fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
      wrapToastAnimation: (AnimationController controller, CancelFunc cancel, Widget child) => CustomAnimationWidget(
        controller: controller,
        child: child,
      ),
    );
  }

  static Duration getDuration(String? text) {
    int milliseconds = ((text?.length ?? 0) * 48).round();
    milliseconds = milliseconds < 2000 ? 2000 : milliseconds;
    milliseconds = milliseconds > 6000 ? 6000 : milliseconds;
    return Duration(milliseconds: milliseconds);
  }
}

class CustomAnimationWidget extends StatefulWidget {
  const CustomAnimationWidget({required this.controller, required this.child, Key? key}) : super(key: key);

  final AnimationController controller;
  final Widget child;

  @override
  _CustomAnimationWidgetState createState() => _CustomAnimationWidgetState();
}

class _CustomAnimationWidgetState extends State<CustomAnimationWidget> {
  static final Tween<Offset> tweenOffset = Tween<Offset>(
    begin: const Offset(125, 0),
    end: const Offset(0, 0),
  );

  static final Tween<double> tweenScale = Tween<double>(begin: 0.7, end: 1.0);
  late Animation<double> animation;

  @override
  void initState() {
    animation = CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) => Transform.translate(
          offset: tweenOffset.evaluate(animation),
          child: Transform.scale(
            scale: tweenScale.evaluate(animation),
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        ),
        child: widget.child,
      );
}
