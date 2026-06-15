part of '_steps.dart';

abstract class OtpStepTemplate extends AuthStepTemplate {
  const OtpStepTemplate({
    super.context,
    super.ref,
  });

  @override
  String get stepId => 'otp';

  @override
  AuthStepLayout get layout => AuthStepLayout(
    title: 'Verify your number',
    subtitle: 'Enter the code sent to {{phone}}',
    actionLabel: 'Verify',
    titleOnTap: (_, _) => ref.goToPreviousAuthStep(),
    subtitleOnTap: (_, _) => ref.goToPreviousAuthStep()
  );

  @override
  String? get title {
    final phone = ref.read(authFlowControllerProvider.select((state) => state.formattedPhone));
    return super.title?.replaceAll('{{phone}}', '[${phone ?? ''}]');
  }

  @override
  String? get subtitle {
    final phone = ref.read(authFlowControllerProvider.select((state) => state.formattedPhone));
    return super.subtitle?.replaceAll('{{phone}}', '[${phone ?? ''}]');
  }
}

class DefaultOtpStepTemplate extends OtpStepTemplate {
  const DefaultOtpStepTemplate({
    super.context,
    super.ref,
  });

  @override
  OtpStepTemplate copyWith({
    required BuildContext context,
    required WidgetRef ref,
  }) => DefaultOtpStepTemplate(context: context, ref: ref);
}
