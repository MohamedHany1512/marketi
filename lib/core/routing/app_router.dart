import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marketi/core/services/services_locator.dart';

import 'package:marketi/features/auth/login/presentation/view_model/login_cubit.dart';
import 'package:marketi/features/auth/login/presentation/views/login_view.dart';

import 'package:marketi/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:marketi/features/onboarding/presentation/view/on_boarding_view.dart';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case AppRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<OnboardingCubit>(
            create: (_) => OnboardingCubit(),
            child: const OnBoardingView(),
          ),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}