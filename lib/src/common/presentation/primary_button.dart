import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rawdah/src/constants/app_sizes.dart';

/// Primary button based on [ElevatedButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconAssetName.isEmpty
                      ? Container()
                      : SvgPicture.asset(
                          iconAssetName,
                          color: Colors.white,
                        ),
                  iconAssetName.isEmpty ? Container() : gapW12,
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
    );
  }
}
