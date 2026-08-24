import 'package:flutter/material.dart';
import 'package:marketi/core/routing/app_router.dart';
import 'package:marketi/core/themes/app_theme.dart';
import 'package:marketi/features/onboarding/presentation/view/on_boarding_view.dart';

void main() {
  runApp(const MarkrtiApp());
}

class MarkrtiApp extends StatelessWidget {
  const MarkrtiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Markrti',
      theme: AppTheme.lightTheme,
       onGenerateRoute: AppRouter.onGenerateRoute,
      home: OnBoardingView()
    );
  }
}