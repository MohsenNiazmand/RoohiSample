import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roohi_sample/config/l10n/app_localization_helper.dart';
import 'package:roohi_sample/config/routes/routes.dart';
import 'package:roohi_sample/config/theme/app_styles.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );
    final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

    useEffect(() {
      animationController.forward();

      animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.go(Routes.facultyProfile);
        }
      });
    }, []);

    return Scaffold(
      body: Center(
          child:
          FadeTransition(
            opacity: opacityAnimation,
            child: Text(
                    context.tr.welcome,
              style: AppStyles().styleText_32_700(),

            ),
          )
      ),
    );
  }
}
