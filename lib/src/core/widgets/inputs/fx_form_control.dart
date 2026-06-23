import 'package:flutter/material.dart';

class FxFormControl {
  const FxFormControl({
    this.autofocus = false,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.hint,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.isPassword = false,
    this.initialValue,
    this.isHidden = false,
    this.controller,
  });

  final bool autofocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool isHidden;
  final String? initialValue;

  String? get value => controller?.text.isEmpty ?? true ? null : controller?.text.trim();

  FxFormControl copyWith({
    TextEditingController? controller,
    bool? autofocus,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? label,
    String? hint,
    FormFieldValidator<String>? validator,
    TextInputType? keyboardType,
    bool? isPassword,
    TextInputAction? textInputAction,
    bool? isHidden,
    String? initialValue,
  }) => FxFormControl(
    autofocus: autofocus ?? this.autofocus,
    prefixIcon: prefixIcon ?? this.prefixIcon,
    suffixIcon: suffixIcon ?? this.suffixIcon,
    label: label ?? this.label,
    hint: hint ?? this.hint,
    validator: validator ?? this.validator,
    keyboardType: keyboardType ?? this.keyboardType,
    isPassword: isPassword ?? this.isPassword,
    textInputAction: textInputAction ?? this.textInputAction,
    controller: controller ?? this.controller,
    isHidden: isHidden ?? this.isHidden,
    initialValue: initialValue ?? this.initialValue,
  );
}

class FxFormGroup {
  const FxFormGroup(Map<String, FxFormControl> controls) : _controls = controls;

  FxFormGroup copyWith(Map<String, FxFormControl> controls) => FxFormGroup(controls);

  final Map<String, FxFormControl> _controls;

  FxFormGroup initState() {
    final controls = _controls.map(
      (key, value) => MapEntry(key, value.copyWith(controller: TextEditingController()))
    );
    return copyWith(controls);
  }

  void dispose() {
    _controls.forEach((key, value) => value.controller?.dispose());
  }

  Map<String, FxFormControl> get controls => _controls;

  FxFormControl getControl(String key) => _controls[key] ?? FxFormControl(label: key);

  void setValue(String key, String value) {
    if (!_controls.containsKey(key)) throw Exception('Control with key $key not found');
    _controls[key] = _controls[key]!.copyWith(
      initialValue: value,
      controller: TextEditingController(text: value)
    );
  }
  
  void updateControl(String key, FxFormControl Function(FxFormControl value) updater) {
    if (!_controls.containsKey(key)) {
      throw Exception('Control with key $key not found');
    }
    _controls[key] = updater(_controls[key]!);
  }
}