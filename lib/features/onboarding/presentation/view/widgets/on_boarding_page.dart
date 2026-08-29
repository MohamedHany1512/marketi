import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/features/onboarding/data/models/on_boarding_model.dart';
import 'package:marketi/features/onboarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:marketi/features/onboarding/presentation/cubit/on_boarding_states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel page;

  const OnboardingPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(page.image, width: 500),
        
          BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final cubit = context.read<OnboardingCubit>();

              return Expanded(
                child: SmoothPageIndicator(
                  controller: cubit.pageController,
                  count: cubit.pageCount,
                  effect: ExpandingDotsEffect(
                    dotHeight: 20,
                    dotWidth: 20,
                    spacing: 8,
                    activeDotColor: Theme.of(context).primaryColor,
                    expansionFactor: 1.01,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          Text(
            page.primaryText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 34),

          Text(
            page.secondaryText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge
                ?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
