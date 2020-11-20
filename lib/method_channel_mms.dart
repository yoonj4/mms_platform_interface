import 'package:flutter/services.dart';

import 'mms_platform_interface.dart';

const MethodChannel _channel = MethodChannel('mms');

/// An implementation of [MmsPlatform] that uses method channels.
class MethodChannelMms extends MmsPlatform {
  @override
  void sendVideo(
      final String videoFilePath,
      final List<String> recipientNumbers) {
    _channel.invokeMethod(
      'sendVideo',
      <String, Object>{
        'videoFilePath': videoFilePath,
        'recipientNumbers': recipientNumbers
      },
    );
  }
}