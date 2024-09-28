import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' as intl;
import 'package:roohi_sample/config/l10n/app_localization_helper.dart';
import 'package:roohi_sample/config/theme/app_styles.dart';
import 'package:roohi_sample/core/constants/colors.dart';
import 'package:roohi_sample/core/constants/form_constants.dart';

import 'package:roohi_sample/core/constants/dimentions.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    required this.name,
    super.key,
    this.controller,
    this.initialValue,
    this.hint,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.showCursor,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSubmitted,
    this.onSaved,
    this.onReset,
    this.inputFormatters,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.buildCounter,
    this.autofillHints,
    this.strutStyle,
    this.scrollPhysics,
    this.scrollController,
    this.labelStyle,
    this.mouseCursor,
    this.valueTransformer,
    this.enabled = true,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.labelPadding = const EdgeInsets.only(bottom: 24),
    this.label,
    this.maxLines = 1,
    this.textAlignVertical = TextAlignVertical.top,
    this.validators = const [],
    this.decoration,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.autocorrect = true,
    this.maxLengthEnforcement = MaxLengthEnforcement.enforced,
    this.enableSuggestions = true,
    this.expands = false,
    this.cursorWidth = 2.0,
    this.enableInteractiveSelection = true,
    this.padding,
    this.scrollPadding = const EdgeInsets.all(20),
    this.contentPadding,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.hintStyle,
    this.isRequired = false,
    this.obscure = false,
  });

  final String name;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hint;

  final String? label;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
  final TextAlignVertical? textAlignVertical;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool autocorrect;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool enableSuggestions;
  final int maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String?>? onChanged;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onReset;
  final VoidCallback? onEditingComplete;
  final FormFieldSetter<String>? onSaved;
  final FormFieldSetter<String>? onSubmitted;
  final List<FormFieldValidator<String>> validators;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final InputCounterWidgetBuilder? buildCounter;
  final Iterable<String>? autofillHints;
  final AutovalidateMode autoValidateMode;
  final StrutStyle? strutStyle;
  final bool enableInteractiveSelection;
  final ScrollPhysics? scrollPhysics;
  final EdgeInsets scrollPadding;
  final ScrollController? scrollController;
  final EdgeInsets? padding;
  final EdgeInsets labelPadding;
  final MouseCursor? mouseCursor;
  final ValueTransformer<String?>? valueTransformer;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool isRequired;
  final bool obscure;
  final EdgeInsetsGeometry? contentPadding;

  @override
  // ignore: library_private_types_in_public_api
  _PrimaryTextFieldState createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  TextDirection textDirection = TextDirection.ltr;
  bool showText = true;

  bool showError = false;

  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null)
              Padding(
                padding: widget.labelPadding,
                child: Text(
                  '${widget.label}${widget.isRequired ? ' *' : ''}',
                  style: AppStyles().styleText_12_500(),
                  textAlign: TextAlign.start,
                ),
              ),
            AnimatedSize(
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 250),
              child: FormBuilderTextField(
                name: widget.name,
                onTap: () {
                  widget.onTap?.call();
                },
                obscureText: widget.obscure ? showText : false,
                controller: widget.controller,
                focusNode: widget.focusNode,
                decoration: widget.decoration ??
                    InputDecoration(
                      hintText: widget.hint,
                      hintStyle:
                          widget.hintStyle ?? AppStyles().styleText_11_500(),
                      fillColor: cGrey,
                      focusColor: Theme.of(context).colorScheme.surface,
                      filled: true,
                      isDense: true,
                      contentPadding: widget.contentPadding ??
                          const EdgeInsets.symmetric(
                            horizontal: dimen16,
                            vertical: dimen12,
                          ),
                      focusedBorder: widget.readOnly
                          ? FormConstants.defaultBorder(context)
                          : FormConstants.focusBorder(context),
                      disabledBorder: FormConstants.defaultBorder(context),
                      enabledBorder: FormConstants.defaultBorder(context),
                      errorBorder: FormConstants.errorBorder(context),
                      focusedErrorBorder: FormConstants.errorBorder(context),
                      errorStyle: AppStyles().styleText_12_500().copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                      prefixIconColor: Theme.of(context).colorScheme.onSurface,
                      prefixIcon: widget.prefixIcon,
                      prefix: widget.prefix,
                      suffix: widget.suffix,
                      suffixIcon: widget.obscure
                          ? IconButton(
                              icon: Icon(
                                Icons.remove_red_eye_rounded,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              onPressed: () {
                                setState(() {
                                  showText = !showText;
                                });
                              },
                            )
                          : widget.suffixIcon,
                    ),
                keyboardType: widget.keyboardType,
                textCapitalization: widget.textCapitalization,
                textInputAction: widget.textInputAction,
                style: widget.style ?? AppStyles().styleText_12_500(),
                textDirection: widget.textDirection ?? textDirection,
                textAlign: widget.textAlign,
                autofocus: widget.autofocus,
                readOnly: widget.readOnly,
                textAlignVertical: widget.textAlignVertical,
                showCursor: widget.showCursor,
                obscuringCharacter: widget.obscuringCharacter,
                autocorrect: widget.autocorrect,
                maxLengthEnforcement: widget.maxLengthEnforcement,
                enableSuggestions: widget.enableSuggestions,
                maxLines: widget.expands ? 1 : widget.maxLines,
                minLines: widget.expands ? null : widget.minLines,
                expands: widget.expands,
                maxLength: widget.maxLength,
                onChanged: (String? value) {
                  setTextDirection(context, value);
                  widget.onChanged?.call(value);
                  if ((value?.length ?? 0) > 0) {
                    setState(() {
                      showError = true;
                    });
                  }
                },
                // onTap: widget.onTap,
                onEditingComplete: widget.onEditingComplete,
                onSaved: widget.onSaved,
                onSubmitted: widget.onSubmitted,
                onReset: widget.onReset,
                // TODO: change it to validator and remove validators
                validator: FormBuilderValidators.compose(
                  List.from(
                    widget.validators,
                  )..insertAll(0, [
                      if (widget.isRequired)
                        FormBuilderValidators.required(
                          errorText: context.tr.isRequired,
                        ),
                    ]),
                ),
                // validator: widget.validator,
                inputFormatters: widget.inputFormatters,
                enabled: widget.enabled,
                cursorWidth: widget.cursorWidth,
                cursorRadius: widget.cursorRadius,
                cursorColor: widget.cursorColor ?? cTextPrimary,
                keyboardAppearance: widget.keyboardAppearance,
                buildCounter: widget.buildCounter,
                autofillHints: widget.autofillHints,
                autovalidateMode: showError
                    ? widget.autoValidateMode
                    : AutovalidateMode.disabled,
                strutStyle: widget.strutStyle,
                mouseCursor: widget.mouseCursor,
                enableInteractiveSelection: widget.enableInteractiveSelection,
                scrollPhysics: widget.scrollPhysics,
                scrollPadding: widget.scrollPadding,
                scrollController: widget.scrollController,
                valueTransformer: widget.valueTransformer,
              ),
            ),
          ],
        ),
      );

  @override
  void afterFirstLayout(BuildContext context) {
    setTextDirection(context, widget.initialValue);
  }

  void setTextDirection(BuildContext context, String? value) {
    final directionValue = (value ?? '').trim();
    setState(() {
      textDirection = directionValue == ''
          ? TextDirection.ltr
          : intl.Bidi.detectRtlDirectionality(directionValue)
              ? TextDirection.rtl
              : TextDirection.ltr;
    });
  }
}
