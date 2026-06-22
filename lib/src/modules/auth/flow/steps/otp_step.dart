part of '_steps.dart';

abstract class OtpStepTemplate extends AuthStepTemplate {
  const OtpStepTemplate({
    super.context,
    super.ref,
  });

  @override
  String get stepId => 'otp';

  int get otpLength => ref.read(fxConfigProvider).otpLength;

  @override
  AuthStepLayout get layout => AuthStepLayout(
    title: 'Verify your number',
    subtitle: 'Enter the {{length}}-digit code sent to {{phone}}',
    actionLabel: 'Verify',
    titleOnTap: (_, _) => ref.goToPreviousAuthStep(),
    subtitleOnTap: (_, _) => ref.goToPreviousAuthStep()
  );

  String? _resolveTemplate(String? template) {
    if (template == null) return null;
    final phone = ref.read(
      authFlowControllerProvider.select((state) => state.formattedPhone),
    );
    return template
        .replaceAll('{{phone}}', '[${phone ?? ''}]')
        .replaceAll('{{length}}', '$otpLength');
  }

  @override
  String? get title => _resolveTemplate(super.title);

  @override
  String? get subtitle => _resolveTemplate(super.subtitle);
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
