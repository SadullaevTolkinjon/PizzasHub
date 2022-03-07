import 'package:flutter/material.dart';

class Constants {
  static snackbar(BuildContext context,String text) {
    ScaffoldMessenger.of(context,).showSnackBar(
       SnackBar(
        content: Text(text),
      ),
    );
  }
}
