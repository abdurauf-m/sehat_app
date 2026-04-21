import 'package:flutter/material.dart';

void navigatorPush(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (builder) => screen));
}

void navigatorPop(BuildContext context) {
  Navigator.pop(context);
}

void navigatorPushAndRemoveUntil(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (builder) => screen),
    (route) => false,
  );
}
