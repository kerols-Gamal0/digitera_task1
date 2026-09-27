import 'package:digitera_task1/core/di/service_locator.dart';
import 'package:digitera_task1/core/services/push_notification_service.dart';
import 'package:digitera_task1/core/theme/app_theme.dart';
import 'package:digitera_task1/core/routes/app_router.dart';
import 'package:digitera_task1/core/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  await getIt<PushNotificationService>().init();

  runApp(const DigiteraApp());
}

class DigiteraApp extends StatelessWidget {
  const DigiteraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digitera Market',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
