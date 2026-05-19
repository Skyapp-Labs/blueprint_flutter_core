import 'package:blueprint_flutter_core/src/core/widgets/display/_display.dart';
import 'package:blueprint_flutter_core/src/core/widgets/layout/_layout.dart';
import 'package:flutter/material.dart';

import 'package:blueprint_flutter_core/src/core/utils/validators.dart';
import 'package:blueprint_flutter_core/src/core/widgets/buttons/fx_button.dart';
import 'package:blueprint_flutter_core/src/core/widgets/fx_context.dart';
import 'package:blueprint_flutter_core/src/core/widgets/inputs/_inputs.dart';
import 'package:blueprint_flutter_core/src/modules/auth/phone_auth/widgets/fx_phone_auth.dart';

class DetailsStep extends StatefulWidget {
  const DetailsStep({
    super.key,
    required this.theme,
    required this.onSubmit,
    required this.isLoading,
  });

  final UserDetailsConfig theme;
  final Future<void> Function({
    required String firstName,
    required String lastName,
    String? email,
  }) onSubmit;
  final bool isLoading;

  @override
  State<DetailsStep> createState() => _DetailsStepState();
}

class _DetailsStepState extends State<DetailsStep> with FxUiToolkit {
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
      widget.theme.title != null || 
      widget.theme.subtitle != null
    );

    return Form(
      key: _formKey,
      child: FxScrollableForm(
        key: const ValueKey('details'),
        header: widget.theme.header,
        footer: _buildFooter(),
        safeArea: widget.theme.safeArea,
        padding: widget.theme.padding,
        spacing: widget.theme.spacing,
        mainAxisAlignment: widget.theme.mainAxisAlignment,
        crossAxisAlignment: widget.theme.crossAxisAlignment,
        children: [
          if(hasTopContent) ...[
            _buildTopContent(),
            SizedBox(height: 0),
          ],
          FxTextField(
            controller: _firstNameController,
            label: 'First name',
            prefix: widget.theme.firstNamePrefix,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            validator: (v) => Validators.required(v, 'First name'),
          ),
          FxTextField(
            controller: _lastNameController,
            label: 'Last name',
            prefix: widget.theme.lastNamePrefix,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            validator: (v) => Validators.required(v, 'Last name'),
          ),
          FxTextField(
            controller: _emailController,
            prefix: widget.theme.emailPrefix,
            label: 'Email (optional)',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          )
        ],
      )
    );
  }

  Widget _buildFooter() {
    if (widget.theme.footer != null) return widget.theme.footer!(_onSubmit, widget.isLoading);

    return FxButton(
      label: widget.theme.buttonLabel,
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

    if (widget.theme.title != null) {
      title = FxText(
        widget.theme.title!,
        style: widget.theme.titleStyle ?? FxTextStyle.fromStyle(typography.headlineSmall).copyWith(textAlign: TextAlign.center),
      );
    }

    if (widget.theme.subtitle != null) {
      subtitle = FxText(
        widget.theme.subtitle!,
        style: widget.theme.subtitleStyle ?? FxTextStyle.fromStyle(typography.bodyMedium).copyWith(textAlign: TextAlign.center),
      );
    }

    if (title == null && subtitle == null) return const SizedBox.shrink();

    return Column(
      spacing: sizes.xs,
      crossAxisAlignment: widget.theme.crossAxisAlignment,
      children: [
        title!,
        subtitle!,
      ],
    );
  }
}
