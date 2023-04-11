part of onboarding;

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.model});

  final Onboarding model;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: Sizes.p24),
          decoration: ShapeDecoration(
            // image: DecorationImage(
            //   fit: BoxFit.cover,
            //   image: AssetImage(model.assetPath),
            // ),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: Sizes.p32,
                cornerSmoothing: 0.6,
              ),
            ),
          ),
          height: height,
        ),
        gapH24,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
              gapH12,
              Text(
                model.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500, color: secondaryText(context)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
