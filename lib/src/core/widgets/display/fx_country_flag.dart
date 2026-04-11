import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

enum FxFlagShape { circle, roundedRect, rect }

class FxCountryFlag extends StatelessWidget {
  const FxCountryFlag({
    super.key,
    required this.countryCode,
    this.size = 28,
    this.shape = FxFlagShape.circle,
  });

  final String countryCode;
  final double size;
  final FxFlagShape shape;

  @override
  Widget build(BuildContext context) {
    return CountryFlag.fromCountryCode(
      countryCode,
      theme: ImageTheme(
        width: shape == FxFlagShape.rect ? size * 1.4 : size,
        height: size,
        shape: switch (shape) {
          FxFlagShape.circle       => const Circle(),
          FxFlagShape.roundedRect  => const RoundedRectangle(4),
          FxFlagShape.rect         => const RoundedRectangle(0),
        }
      )
    );
  }
}
