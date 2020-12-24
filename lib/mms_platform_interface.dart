import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_mms.dart';

/// The interface that implementations of mms must implement.
///
/// Platform implementations should extend this class rather than implement it as `mms`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [MmsPlatform] methods.
abstract class MmsPlatform extends PlatformInterface {
  /// Constructs a MmsPlatform.
  MmsPlatform() : super(token: _token);

  static final Object _token = Object();

  static MmsPlatform _instance = MethodChannelMms();

  /// The default instance of [MmsPlatform] to use.
  ///
  /// Defaults to [MethodChannelMms].
  static MmsPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [MmsPlatform] when they register themselves.
  static set instance(MmsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Creates an MMS message with the video at [videoFilePath]
  /// and sends it to the recipients in [recipientNumbers].
  void sendVideo(
      final String videoFilePath,
      final List<String> recipientNumbers) {
    throw UnimplementedError('sendVideo() has not been implemented.');
  }

  /// Creates an MMS message with the video at [videoFilePath].
  /// Uses the default MMS app on the device to allow the user to confirm sending it to [recipientNumbers].
  void sendVideoWithDefaultApp(
      final String videoFilePath,
      final List<String> recipientNumbers) {
    throw UnimplementedError('sendVideoWithDefaultApp() has not been implemented.');
  }
}