import 'package:flutter/material.dart';

import '../screens/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => Home(),
  '/home': (context) => Home(),
};
