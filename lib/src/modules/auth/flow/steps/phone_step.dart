part of '_steps.dart';

abstract class PhoneStep extends BaseStep {
  @override
  String get key => 'phone_step';

  @override
  String? get title => 'Enter your phone number';

  @override
  String? get subtitle => 'We will send you a code to verify your phone number';

  @override
  String get actionLabel => 'Send code';
}

class DefaultPhoneStep extends PhoneStep {}