import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_field_options.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_phone_input_theme.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_text_field.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart' show FxOverlayOptions, FxOverlayTile;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blueprint_flutter_core/src/core/config/fx_config.dart';
import 'package:blueprint_flutter_core/src/core/data/fx_countries.dart';
import 'package:blueprint_flutter_core/src/core/utils/formatters/phone_formatter.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/fx_country_flag.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/fx_select_field.dart';
import 'package:blueprint_flutter_core/src/core/widgets/overlay/fx_overlay.dart'
    show FxOverlayType;

part 'fx_phone_input_data.dart';

class FxPhoneInput extends ConsumerStatefulWidget {
  const FxPhoneInput({
    super.key,
    this.config = const FxPhoneInputConfig(),
    this.controller,
    this.initialValue,
    this.initialCountryCode,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onSaved,
  });

  final FxPhoneInputConfig config;
  final TextEditingController? controller;
  final String? initialValue;
  final String? initialCountryCode;
  final FormFieldValidator<String>? validator;
  final FxPhoneInputChanged? onChanged;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String?>? onSaved;

  @override
  ConsumerState<FxPhoneInput> createState() => _FxPhoneInputState();
}

class _FxPhoneInputState extends ConsumerState<FxPhoneInput> {
  late FxCountry _country;
  late final TextEditingController _controller;
  late final bool _ownsController;
  var _parseGen = 0;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _controller = widget.controller ?? TextEditingController();
    _country = FxCountries.byCode(
          widget.initialCountryCode ??
              ref.read(fxConfigProvider).initialCountryCode,
        ) ??
        FxCountries.all.first;
    if (widget.initialValue?.isNotEmpty ?? false) {
      _controller.text = widget.initialValue!;
    }
    _controller.addListener(_emitChange);
  }

  @override
  void dispose() {
    _controller.removeListener(_emitChange);
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

  void _emitChange() {
    final cb = widget.onChanged;
    if (cb == null) return;

    final digits = _controller.text.replaceAll(' ', '');
    if (digits.isEmpty) return cb(_country, '', null);

    final gen = ++_parseGen;
    final composed = '${_country.dialCode}$digits';
    PhoneFormatter.tryParse(composed, country: _country).then((parsed) {
      if (!mounted || gen != _parseGen) return;
      cb(_country, digits, parsed);
    });
  }

  void _onCountryChanged(FxCountry country) {
    setState(() => _country = country);
    _emitChange();
  }

  FxPhoneInputViewData layoutData(BuildContext context) => FxPhoneInputViewData(
    config: widget.config,
    theme: context.themeData.phoneInputTheme,
    selectedCountry: _country,
    onCountryChanged: _onCountryChanged,
    favoriteCountries: resolveFavoriteCountries(
      ref.read(fxConfigProvider).favoriteCountries,
    ),
    countries: FxCountries.all,
    controller: _controller,
    validator: widget.validator,
    onSaved: widget.onSaved,
    onSubmitted: widget.onSubmitted,
  );

  @override
  Widget build(BuildContext context) => _FxPhoneInputLayout(
    data: layoutData(context)
  );
}