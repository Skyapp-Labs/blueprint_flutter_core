part of '_steps.dart';

enum FxNameLayout { fullName,  split }

class FxSignupFormGroup extends FxFormGroup {

  const FxSignupFormGroup({
    Map<String, FxFormControl> controls = const {},
  }) : super(controls);

  FxSignupFormGroup.initial() : super({
    'firstName': FxFormControl(
      label: 'First Name',
      hint: 'Enter your first name'
    ),
    'lastName': FxFormControl(
      label: 'Last Name',
      hint: 'Enter your last name'
    ),
    'fullNumber': FxFormControl(
      label: 'Full Number',
      hint: 'Enter your full number'
    ),
    'username': FxFormControl(
      label: 'Username',
      hint: 'Enter your username'
    ),
    'phone': FxFormControl(
      label: 'Phone',
      hint: 'Enter your phone'
    ),
    'countryCode': FxFormControl(
      label: 'Country Code',
      hint: 'Enter your country code'
    ),
    'email': FxFormControl(
      label: 'Email',
      hint: 'Enter your email',
      keyboardType: TextInputType.emailAddress,
      validator: Validators.email,
    ),
    'password': FxFormControl(
      label: 'Password',
      hint: 'Enter your password',
      isPassword: true,
      validator: Validators.password,
    ),
    'confirmPassword': FxFormControl(
      label: 'Confirm Password',
      hint: 'Enter your confirm password',
      isPassword: true
    ),
    'gender': FxFormControl(
      label: 'Gender',
      hint: 'Enter your gender'
    ),
    'dateOfBirth': FxFormControl(
      label: 'Date of Birth',
      hint: 'Enter your date of birth'
    )
  });

  @override
  FxSignupFormGroup initState() => copyWith(controls.map(
    (key, value) => MapEntry(key, value.copyWith(controller: TextEditingController()))
  ));

  @override
  FxSignupFormGroup copyWith(Map<String, FxFormControl> controls) => FxSignupFormGroup(controls: controls);

  FxFormControl get firstName => getControl('firstName');
  FxFormControl get lastName => getControl('lastName');
  FxFormControl get fullNumber => getControl('fullNumber');
  FxFormControl get username => getControl('username');
  FxFormControl get gender => getControl('gender');
  FxFormControl get phone => getControl('phone');
  FxFormControl get countryCode => getControl('countryCode');
  FxFormControl get dateOfBirth => getControl('dateOfBirth');
  FxFormControl get email => getControl('email');
  FxFormControl get password => getControl('password');
  FxFormControl get confirmPassword => getControl('confirmPassword');

  FxSignupFormGroup hidePassword() {
    updateControl('password', (value) => value.copyWith(isHidden: true));
    updateControl('confirmPassword', (value) => value.copyWith(isHidden: true));
    return this;
  }
}


abstract class SignupStepTemplate extends AuthStepTemplate {
  const SignupStepTemplate();

  FxNameLayout get nameLayout => FxNameLayout.split;

  FxSignupFormGroup get formGroup => FxSignupFormGroup.initial();

  @override
  String get stepId => 'signup';

  @override
  AuthStepLayout get layout => AuthStepLayout(
    title: 'Create your account',
    subtitle: 'Do you already have an account? [Log in]',
    actionLabel: 'Create account',
    subtitleOnTap: (_, _, context) => context.goToAuthStep(AuthStep.emailAndPassword),
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    textAlign: TextAlign.start,
  );

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) => PreferredSize(
    preferredSize: Size.fromHeight(context.sizes.appBarHeight),
    child: Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => ref.goToAuthStep(AuthStep.emailAndPassword), 
        icon: context.componentTheme.navigateBackIcon
      ),
    )
  );
}

class DefaultSignupStepTemplate extends SignupStepTemplate {
  const DefaultSignupStepTemplate();
}
