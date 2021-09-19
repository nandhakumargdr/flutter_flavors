import 'package:flutter/material.dart';
import 'package:multi_flavors/core/utils/flavor_config.dart';
import 'package:multi_flavors/core/widgets/flavor/flavor_banner.dart';
import 'package:multi_flavors/modules/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FlavorConfig.instance.values.showFlavorBanner
            ? FlavorBanner(child: const HomePage())
            : const HomePage());
  }
}
