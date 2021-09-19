import 'package:flutter/material.dart';

import 'app.dart';
import 'core/utils/flavor_config.dart';

void main() async {
/*  await FlutterAppConfig(
    environment: AppEnvironment.production,
    apiBaseUrl: 'https://api.com',
    appName: 'Flutter app',
  ).run();*/

  FlavorConfig(
      flavor: Flavor.PRODUCTION,
      color: Colors.deepPurpleAccent,
      values: FlavorConfigValues(
          baseUrl:
          'https://api.com'));

  runApp(const MyApp());
}
