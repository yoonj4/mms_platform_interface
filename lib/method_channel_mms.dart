import 'dart:async';

import 'package:flutter/services.dart';

import 'mms_platform_interface.dart';

const MethodChannel _channel = MethodChannel('plugins.flutter.io/mms');

/// An implementation of [MmsPlatform] that uses method channels.
class MethodChannelMms extends MmsPlatform {
  @override
  Future<bool> sendVideo(
      final String videoFilePath,
      final List<String> recipientNumbers) {
    return _channel.invokeMethod<bool>(
      'sendVideo',
      <String, Object>{
        'videoFilePath': videoFilePath,
        'recipientNumbers': recipientNumbers
      },
    );
  }
}