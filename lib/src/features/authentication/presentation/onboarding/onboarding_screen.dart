library onboarding;

import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/features/authentication/data/onboarding_provider.dart';
import 'package:rawdah/src/features/authentication/data/onboarding_data.dart';
import 'package:rawdah/src/features/authentication/domain/onboarding.dart';
import 'package:rawdah/src/themes/text_color.dart';

part 'onboarding_page.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  // -- Variables --
  final _controller = PageController(initialPage: 0);
  int _currentIndex = 0;
  bool get _isLastIndex => _currentIndex + 1 == kOnboardingData.length;

  // -- Methods --
  _nextPage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  _complete() {
    // ref.read(sharedPreferencesServiceProvider).setOnboardingComplete();
    ref.read(onboardingProvider.notifier).completeOnboarding();
  }

  // -- Init --
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: Sizes.p24),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 8,
                child: PageView.builder(
                  physics: const ClampingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (index) =>
                      setState(() => _currentIndex = index),
                  itemCount: kOnboardingData.length,
                  itemBuilder: (context, index) {
                    return _OnboardingPage(model: kOnboardingData[index]);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          kOnboardingData.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(left: Sizes.p4),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              width: Sizes.p24,
                              height: Sizes.p8,
                              decoration: BoxDecoration(
                                color: index == _currentIndex
                                    ? primary(context)!
                                    : Colors.blueGrey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(Sizes.p8),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: Sizes.p16),
                      child: Row(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.grey),
                            onPressed: _complete,
                            child: const Text(
                              'Пропустить',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: _isLastIndex ? _complete : _nextPage,
                            child: Row(
                              children: [
                                Text(
                                  _isLastIndex ? 'Начать' : 'Дальше',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700),
                                ),
                                // gapW8,
                                // SvgPicture.asset(
                                //   AppIcons.onboardingArrow.assetName,
                                //   color: primary(context),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
