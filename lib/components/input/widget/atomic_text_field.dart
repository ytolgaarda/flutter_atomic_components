import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../enum/input_type.dart';
import '../regex/input_validators.dart';

class AtomicTextField extends StatelessWidget {
  final TextInputType? textInputType;
  final int lengthLimit;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final VoidCallback? onTap;
  final bool? readOnly;
  final TextEditingController? controller;
  final RegExp? allowRegExp;
  final RegExp? denyRegExp;
  final Widget? pIcon;
  final Widget? sIcon;
  final Color? errorTextColor;
  final String? label;
  final TextStyle? labelStyle;
  final double? radius;
  final String? hint;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final int? maxLine;
  final int? minLine;
  final TextInputAction? textInputAction;
  final String? counterText;
  final bool? isDense;
  final TextStyle? textStyle;
  final bool? enabled;
  final List<BoxShadow>? boxShadow;
  final Color? borderColor;
  final double? borderWidth;
  final bool? obscure;
  final Color? textColor;
  final Color? cursorColor;
  final InputValidatorType? validatorType;
  final String? errorMessage;

  const AtomicTextField({
    super.key,
    this.textInputType,
    this.lengthLimit = 100,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.readOnly,
    this.controller,
    this.allowRegExp,
    this.denyRegExp,
    this.pIcon,
    this.sIcon,
    this.errorTextColor,
    this.label,
    this.labelStyle,
    this.radius = 10,
    this.hint,
    this.hintStyle,
    this.fillColor,
    this.maxLine = 1,
    this.minLine,
    this.textInputAction,
    this.counterText,
    this.isDense,
    this.textStyle,
    this.enabled,
    this.boxShadow,
    this.borderColor,
    this.obscure,
    this.textColor,
    this.cursorColor,
    this.borderWidth,
    this.validatorType,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle themeTextStyle = Theme.of(context).textTheme.bodyMedium!;
    Color primaryColor = Theme.of(context).colorScheme.primary;
    Color secondaryColor = Theme.of(context).colorScheme.primary;

    return TextFormField(
      style: themeTextStyle.copyWith(color: textColor ?? primaryColor),
      readOnly: readOnly ?? false,
      onTap: onTap,
      obscureText: obscure ?? false,
      enabled: enabled,
      textInputAction: textInputAction,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: maxLine,
      minLines: minLine,
      cursorColor: cursorColor,
      inputFormatters: [
        LengthLimitingTextInputFormatter(lengthLimit),
        // Buraya isteğe bağlı olarak diğer formatters eklenebilir
      ],
      keyboardType: textInputType,
      validator: validatorType == null
          ? null
          : (value) => InputValidators.validate(
                value ?? '',
                validatorType!,
                customPattern: 'we can add custom Regex pattern in this class',
                customErrorMessage: errorMessage,
              ),
      controller: controller,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: errorTextColor),
        isDense: isDense,
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
          borderSide: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0,
          ),
        ),
        filled: true,
        fillColor: fillColor,
        prefixIcon: pIcon,
        suffixIcon: sIcon,
        hintText: hint,
        hintStyle: hintStyle,
        labelText: label,
        labelStyle: labelStyle,
        counterText: counterText,
        counterStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
