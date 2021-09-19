import 'package:flutter/material.dart';

import 'app.dart';
import 'core/utils/flavor_config.dart';

void main() async {
  FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.deepPurpleAccent,
      values: FlavorConfigValues(baseUrl: 'https://dev.api.com'));

  runApp(const MyApp());
}
