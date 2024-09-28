import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:roohi_sample/config/routes/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoohiSampleApp extends HookConsumerWidget{
  RoohiSampleApp({super.key});
  final _appRouter = AppRouter().router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final botToastBuilder = BotToastInit();

    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
    );
  }

}