import 'package:flutter/material.dart';

showErrorSnackBar(BuildContext context, String errMsg) {
  //show error message
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('$errMsg, Please try again'),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  ));
}
