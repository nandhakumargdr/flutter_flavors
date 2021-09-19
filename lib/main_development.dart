import 'package:flutter/material.dart';

import 'app.dart';
import 'core/utils/flavor_config.dart';

void main() async {
  // await FlutterAppConfig(
  //   environment: AppEnvironment.development,
  //   apiBaseUrl: 'https://dev.api.com',
  //   appName: 'Flutter app dev',
  // ).run();

  FlavorConfig(
      flavor: Flavor.DEV,
      color: Colors.deepPurpleAccent,
      values: FlavorConfigValues(
          baseUrl:
              'https://dev.api.com'));

  runApp(const MyApp());
}
