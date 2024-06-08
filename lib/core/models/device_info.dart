import 'package:flutter/material.dart';
import 'package:temp_task2/core/enums/device_type.dart';

class DeviceInfo {
  final Orientation orientation;
  final DeviceType deviceType;
  final double screenWidth;
  final double screenHeight;
  final double localWidth;
  final double localHeight;

  DeviceInfo(
      {this.orientation = Orientation.landscape,
      this.deviceType = DeviceType.Mobile,
      this.screenWidth = 0,
      this.screenHeight = 0,
      this.localWidth = 0,
      this.localHeight = 0});
}
