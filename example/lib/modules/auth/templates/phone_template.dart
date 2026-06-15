import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:blueprint_flutter_core/blueprint_auth.dart';

class PhoneTemplate extends PhoneStepTemplate {
  const PhoneTemplate({
    super.context,
    super.ref,
  });

  @override
  PhoneStepTemplate copyWith({
    required BuildContext context,
    required WidgetRef ref,
  }) => PhoneTemplate(context: context, ref: ref);
}
