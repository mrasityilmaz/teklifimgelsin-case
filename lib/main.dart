import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:teklifimgelsin_case/core/services/logger/logger_service.dart';
import 'package:teklifimgelsin_case/data/services/hive_service/hive_service.dart';
import 'package:teklifimgelsin_case/injection/injection_container.dart';
import 'package:teklifimgelsin_case/presentation/views/home_view/home_view.dart';
import 'package:teklifimgelsin_case/shared/app_theme.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ThemeManager.initialise();

    ///
    /// Hive Service Initialization and Adapter Registration
    ///
    await HiveService.instance.init();

    ///
    /// Configure Dependencies for the GetIt Service Locator
    ///
    await configureDependencies();

    ///
    ///
    ///
    runApp(
      const MyApp(),
    );

    ///
    ///
    ///
  }, (Object error, StackTrace stack) async {
    if (kDebugMode) {
      LoggerService.instance.printErrorLog(error, stack);
    }
  });

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (kDebugMode) {
      LoggerService.instance.printErrorLog(details.exception, details.stack ?? StackTrace.current);
    }
  };
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      darkTheme: AppTheme.instance.darkTheme,
      lightTheme: AppTheme.instance.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) {
        return MaterialApp(
          title: 'Teklifim Gelsin',
          debugShowCheckedModeBanner: false,
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const HomeView(),
        );
      },
    );
  }
}
