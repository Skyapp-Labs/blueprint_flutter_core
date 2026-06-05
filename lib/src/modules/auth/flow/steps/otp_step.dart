part of '_steps.dart';

abstract class OtpStep extends BaseStep {
  @override
  String get key => 'otp_step';

  @override
  String? get title => 'Verify your number';

  @override
  String? get subtitle => 'Enter the code sent to {{phone}}';

  @override
  String get actionLabel => 'Verify';
}

class DefaultOtpStep extends OtpStep { }