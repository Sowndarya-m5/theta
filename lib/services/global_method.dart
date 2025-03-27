import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GlobalMethods {
  static navigateTo(
      {required BuildContext context, required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }
}
