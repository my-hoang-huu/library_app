import 'package:flutter/material.dart';

// https://github.com/aarajput/flutter_form_validators
class Validators {
  Validators._();

  static FormFieldValidator<String> required({String? errorMessage}) {
    return (value) {
      value ??= '';
      if (value.trim().isEmpty)
        return errorMessage ?? 'Please enter!';
      else
        return null;
    };
  }

  static FormFieldValidator<dynamic> requiredAny({String? errorMessage}) {
    return (value) {
      if (value == null) {
        return errorMessage ?? 'Vui lòng nhập thông tin hợp lệ';
      } else
        return null;
    };
  }

  static FormFieldValidator<String> exactLength(int expectLength, {String? errorMessage}) {
    return (value) {
      value ??= '';

      if (value.trim().isEmpty) return null;

      if (value.length != expectLength)
        return errorMessage ?? "Vui lòng nhập đúng $expectLength ký tự";

      return null;
    };
  }

  static FormFieldValidator<String> min(int min, {String? errorMessage}) {
    return (value) {
      value ??= '';

      if (value.trim().isEmpty) return null;

      if (value.length < min) return errorMessage ?? "Vui lòng nhập ít nhất $min ký tự";

      return null;
    };
  }

  static FormFieldValidator<String> max(int max, {String? errorMessage}) {
    return (value) {
      value ??= '';

      if (value.trim().isEmpty) return null;

      if (value.length > max) return errorMessage ?? "Không nhập quá $max ký tự";
      return null;
    };
  }

  static FormFieldValidator<String> email() {
    return patternString(
        "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
        'Vui lòng nhập địa chỉ Email hợp lệ');
  }

  static FormFieldValidator<String> emailRequired() {
    return (value) {
      if (value == null || value.isEmpty) return required()(value);

      return patternString(
          "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
          'Vui lòng nhập địa chỉ Email hợp lệ')(value);
    };
  }

  static FormFieldValidator<String> emailAllowEmpty() {
    return ((value) {
      if (value == null || value.isEmpty == true) return null;
      return patternString(
          "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
          'Vui lòng nhập địa chỉ Email hợp lệ')(value);
    });
  }

  static FormFieldValidator<String> phoneNumber() {
    return (value) {
      value = value?.replaceAll(' ', '');
      if (value == null) return required()(value);
      if (value.length < 9 || value.length > 10) {
        return 'Vui lòng nhập số điện thoại hợp lệ';
      }

      if (value.length == 9) {
        value = '0' + value;
      }

      return patternString(r'^((\+84)|(84)|0)+((3[^01])|(5[689])|(7[06789])|(8[^0])|(9[^5]))+\d{7}',
          'Vui lòng nhập số điện thoại hợp lệ')(value);
    };
  }

  static FormFieldValidator<String> phoneNumberAllowEmpty() {
    return (value) {
      if (value == null || value.isEmpty == true) return null;
      value = value.replaceAll(' ', '');
      if (value.length < 9 || value.length > 10) {
        return 'Vui lòng nhập số điện thoại hợp lệ';
      }

      if (value.length == 9) {
        value = '0' + value;
      }

      return patternString(r'^((\+84)|(84)|0)+((3[^01])|(5[689])|(7[06789])|(8[^0])|(9[^5]))+\d{7}',
          'Vui lòng nhập số điện thoại hợp lệ')(value);
    };
  }

  static FormFieldValidator<String> nameRequired({String? errorMessage}) {
    return (value) {
      value ??= '';

      if (value.trim().isEmpty) return errorMessage ?? 'Vui lòng nhập thông tin hợp lệ';

      return patternString(
          r"^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$",
          'Invalid Name')(value);
    };
  }

  static FormFieldValidator<String> nameAllowEmpty({String? errorMessage}) {
    return (value) {
      if (value == null || value.isEmpty == true) return null;

      return patternString(
          r"^[a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]+$",
          errorMessage ?? 'Invalid Name')(value);
    };
  }

  static FormFieldValidator<String> nickName({String? errorMessage}) {
    return (value) {
      if (value == null || value.isEmpty == true) return null;
      return patternString(r"^[^0-9]\w+$", errorMessage ?? 'Invalid Nickname')(value);
    };
  }

  static FormFieldValidator<String> removeSpecialCharacters({String? errorMessage}) {
    return (value) {
      if (value == null || value.isEmpty == true) return null;
      return patternString(r'^[a-zA-Z0-9]+$', errorMessage ?? 'Giá trị nhập không hợp lệ')(value);
    };
  }

  static FormFieldValidator<String> patternString(String pattern, String errorMessage) {
    return patternRegExp(RegExp(pattern), errorMessage);
  }

  static FormFieldValidator<String> patternRegExp(RegExp pattern, String errorMessage) {
    return (value) {
      value ??= '';
      if (value.trim().isEmpty) return null;

      if (pattern.hasMatch(value))
        return null;
      else
        return errorMessage;
    };
  }

  static FormFieldValidator<String> compareWith({required String? source, String? compareName}) {
    return (value) {
      if (source == null) {
        return 'Giá trị so sánh bị trống';
      }
      if (value != source) {
        return 'Giá trị nhập' + ' ' + 'không trùng khớp với ${compareName ?? 'giá trị so sánh'} ';
      }
      return null;
    };
  }

  static FormFieldValidator<String> compareWithController(
      {required TextEditingController controllerCompare, String? errorCompareMessage}) {
    return (value) {
      if (controllerCompare.text.isEmpty) {
        return 'Giá trị so sánh bị trống';
      }
      if (value != controllerCompare.text) {
        return errorCompareMessage ?? 'Giá trị nhập' + ' ' + 'không trùng khớp với giá trị so sánh';
      }
      return null;
    };
  }

  static FormFieldValidator<String> handle(List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
