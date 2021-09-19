import 'package:flutter/material.dart';
import 'package:multi_flavors/core/widgets/flavor/flavor_banner.dart';
import 'package:multi_flavors/modules/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlavorBanner(child: const HomePage()),
    );
  }
}