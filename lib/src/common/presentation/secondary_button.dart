import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rawdah/src/constants/app_sizes.dart';
import 'package:rawdah/src/themes/text_color.dart';

/// Secondary button based on [ElevatedButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.text,
    this.iconAssetName = '',
    this.isLoading = false,
    this.onPressed,
  });

  final String text;
  final String iconAssetName;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: Theme.of(context).dividerColor),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconAssetName.isEmpty
                      ? Container()
                      : SvgPicture.asset(
                          iconAssetName,
                          color: primaryText(context),
                        ),
                  iconAssetName.isEmpty ? Container() : gapW12,
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }
}
