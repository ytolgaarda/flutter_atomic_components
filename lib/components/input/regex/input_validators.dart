import '../enum/input_type.dart';

class InputValidators {
  static String? validate(
    String value,
    InputValidatorType type, {
    String? customPattern,
    String? customErrorMessage,
  }) {
    String? pattern =
        type == InputValidatorType.custom ? customPattern : type.regex;
    if (pattern == null) return null;

    final regex = RegExp(pattern);
    return regex.hasMatch(value)
        ? null
        : (customErrorMessage ?? type.noMatchMessage);
  }
}
