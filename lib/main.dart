import 'package:flutter/material.dart';
import 'package:marketi/core/helper/cache_helper.dart';
import 'package:marketi/core/routing/app_router.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/services/services_locator.dart';
import 'package:marketi/core/themes/app_theme.dart';

 Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();

  setupServiceLocator();
  runApp(const MarketiApp());
}

class MarketiApp extends StatelessWidget {
  const MarketiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         debugShowCheckedModeBanner: false,
     initialRoute: AppRoutes.onBoarding,
        title: 'Marketi',
      theme: AppTheme.lightTheme,
       onGenerateRoute: AppRouter.onGenerateRoute,
     
    );
  }
}