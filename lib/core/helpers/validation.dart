import 'package:flutter/material.dart';

class ValidationHelper {

  static String? fillFormValidation(BuildContext context, String? text) {
    if (text!.isEmpty) {
      return '';
    } else {
      return null;
    }
  }

}