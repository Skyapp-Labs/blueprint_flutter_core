import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:blueprint_flutter_core/src/core/widgets/display/_display.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/styles/fx_register_entry_style.dart';

class RegisterEntry extends StatefulWidget {
  const RegisterEntry({
    super.key,
    required this.style,
    required this.onSubmit,
    required this.isLoading,
  });

  final FxRegisterEntryStyle style;
  final Future<void> Function({
    required String firstName,
    required String lastName,
    String? email,
  }) onSubmit;
  final bool isLoading;

  @override
  State<RegisterEntry> createState() => _RegisterEntryState();
}

class _RegisterEntryState extends State<RegisterEntry> with FxUiToolkit {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setToolkitContext(context);

    final hasTopContent = (
      widget.style.title != null || 
      widget.style.subtitle != null
    );

    return Form(
      key: _formKey,
      child: FxScrollableForm(
        key: const ValueKey('details'),
        header: widget.style.header,
        footer: _buildFooter(),
        safeArea: widget.style.safeArea,
        padding: widget.style.padding,
        spacing: widget.style.spacing,
        mainAxisAlignment: widget.style.mainAxisAlignment,
        crossAxisAlignment: widget.style.crossAxisAlignment,
        children: [
          if(hasTopContent) ...[
            _buildTopContent(),
            SizedBox(height: 0),
          ],
          FxTextField(
            controller: _firstNameController,
            label: 'First name',
            prefix: widget.style.firstNamePrefix,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            validator: (v) => Validators.required(v, 'First name'),
          ),
          FxTextField(
            controller: _lastNameController,
            label: 'Last name',
            prefix: widget.style.lastNamePrefix,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            validator: (v) => Validators.required(v, 'Last name'),
          ),
          FxTextField(
            controller: _emailController,
            prefix: widget.style.emailPrefix,
            label: 'Email (optional)',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          )
        ],
      )
    );
  }

  Widget _buildFooter() {
    if (widget.style.footer != null) return widget.style.footer!(_onSubmit, widget.isLoading);

    return FxButton(
      label: widget.style.buttonLabel,
      isLoading: widget.isLoading,
      onPressed: _onSubmit,
    );
  }

  void _onSubmit() async {
    if (!(_formKey.currentState?.validate() ?? false) || widget.isLoading) return;

    await widget.onSubmit(
      email: _emailController.text,
      lastName: _lastNameController.text,
      firstName: _firstNameController.text,
    );
  }


  
  Widget _buildTopContent() {
    Widget? title;
    Widget? subtitle;

    if (widget.style.title != null) {
      title = FxText(
        widget.style.title!,
        style: widget.style.titleStyle ?? FxTextStyle.fromStyle(typography.headlineSmall).copyWith(textAlign: TextAlign.center),
      );
    }

    if (widget.style.subtitle != null) {
      subtitle = FxText(
        widget.style.subtitle!,
        style: widget.style.subtitleStyle ?? FxTextStyle.fromStyle(typography.bodyMedium).copyWith(textAlign: TextAlign.center),
      );
    }

    if (title == null && subtitle == null) return const SizedBox.shrink();

    return Column(
      spacing: sizes.xs,
      crossAxisAlignment: widget.style.crossAxisAlignment,
      children: [
        title!,
        subtitle!,
      ],
    );
  }
}
