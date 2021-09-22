import 'package:flutter/material.dart';
import 'package:multi_flavors/core/utils/flavor_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text('Flutter Flavors')),
          body: Center(child: Column(
            children: [
              Text("Flavor: ${FlavorConfig.instance.name}"),
              Text("Flavor: ${FlavorConfig.instance.values.baseUrl}"),
            ],
          ))),
    );
  }
}
