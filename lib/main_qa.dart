import 'package:flutter/material.dart';

import 'app.dart';
import 'core/utils/flavor_config.dart';

void main() async {
  FlavorConfig(
      flavor: Flavor.QA,
      color: Colors.deepPurpleAccent,
      values: FlavorConfigValues(baseUrl: 'https://qa.api.com'));

  runApp(const MyApp());
}
