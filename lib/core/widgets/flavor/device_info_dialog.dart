import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:multi_flavors/core/utils/flavor_config.dart';
import 'package:multi_flavors/core/utils/device_utils.dart';
import 'package:multi_flavors/core/utils/string_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoDialog extends StatelessWidget {

  DeviceInfoDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 10.0),
      title: Container(
        padding: EdgeInsets.all(15.0),
        color: FlavorConfig.instance.color,
        child: Text(
          'Device Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      titlePadding: EdgeInsets.all(0),
      content: _getContent(),
    );
  }

  Widget _getContent() {
    if (Platform.isAndroid) {
      return _androidContent();
    }

    if (Platform.isIOS) {
      return _iOSContent();
    }

    return Text("You're not on Android neither iOS");
  }

  Widget _iOSContent() {
    return FutureBuilder(
        future: Future.wait([DeviceUtils.iosDeviceInfo(), DeviceUtils.packageInfo()]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) return Container();

          IosDeviceInfo device = snapshot.data![0];
          PackageInfo packageInfo = snapshot.data![1];

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTile('Flavor:', '${FlavorConfig.instance.name}'),
                _buildTile('Build mode:', '${StringUtils.enumName(DeviceUtils.currentBuildMode().toString())}'),
                _buildTile('Physical device?:', '${device.isPhysicalDevice}'),
                _buildTile('Device:', '${device.name}'),
                _buildTile('Model:', '${device.model}'),
                _buildTile('System name:', '${device.systemName}'),
                _buildTile('System version:', '${device.systemVersion}'),
                _buildTile('Package name:', '${packageInfo.packageName}'),
                _buildTile('Package version:', '${packageInfo.version}'),
                _buildTile('Build number:', '${packageInfo.buildNumber}'),
              ],
            ),
          );
        });
  }

  Widget _androidContent() {
    return FutureBuilder(
        future: Future.wait([DeviceUtils.androidDeviceInfo(), DeviceUtils.packageInfo()]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) return Container();

          AndroidDeviceInfo device = snapshot.data![0];
          PackageInfo packageInfo = snapshot.data![1];
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTile('Flavor:', '${FlavorConfig.instance.name}'),
                _buildTile('Build mode:', StringUtils.enumName(DeviceUtils.currentBuildMode().toString())),
                _buildTile('Physical device:', '${device.isPhysicalDevice}'),
                _buildTile('Manufacturer:', '${device.manufacturer}'),
                _buildTile('Model:', '${device.model}'),
                _buildTile('Android version:', '${device.version.release}'),
                _buildTile('Android SDK:', '${device.version.sdkInt}'),
                _buildTile('Package name:', packageInfo.packageName),
                _buildTile('Package version:', packageInfo.version),
                _buildTile('Build number:', packageInfo.buildNumber),
              ],
            ),
          );
        });
  }


  Widget _buildTile(String key, String value) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            key,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 4.0),
          Flexible(child: Text(value))
        ],
      ),
    );
  }

}