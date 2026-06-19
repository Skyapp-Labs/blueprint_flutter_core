import 'package:blueprint_flutter_core/blueprint_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpTemplate extends OtpStepTemplate {
  const OtpTemplate({
    super.context,
    super.ref,
  });

  @override
  OtpStepTemplate copyWith({
    required BuildContext context,
    required WidgetRef ref,
  }) => OtpTemplate(context: context, ref: ref);
}
