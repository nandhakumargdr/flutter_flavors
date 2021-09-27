import 'package:flutter/material.dart';

import 'string_utils.dart';

enum Flavor {
  DEV,
  QA,
  PRODUCTION,
}

class FlavorConfigValues {
  FlavorConfigValues({this.showFlavorBanner = true, @required this.baseUrl});

  final bool showFlavorBanner;
  final String? baseUrl;
//Add other flavor specific values, e.g database name
}

class FlavorConfig {
  late final Flavor? flavor;
  late final String? name;
  late final Color? color;
  late final FlavorConfigValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig(
      {@required Flavor? flavor,
      Color color: Colors.blue,
      required FlavorConfigValues values}) {
    _instance ??= FlavorConfig._internal(
        flavor, StringUtils.enumName(flavor.toString()), color, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isDevelopment() => _instance!.flavor == Flavor.DEV;

  static bool isQA() => _instance!.flavor == Flavor.QA;

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;
}
