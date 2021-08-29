import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class _VideoPlayerControllerCreator {
  const _VideoPlayerControllerCreator();

  /// Constructs a [VideoPlayerController] playing a video from an asset.
  VideoPlayerController asset(
    String dataSource, {
    String? package,
    Future<ClosedCaptionFile>? closedCaptionFile,
    VideoPlayerOptions? videoPlayerOptions,
    List<Object?>? keys,
  }) {
    return use(_VideoPlayerControllerAssetHook(
      dataSource,
      package: package,
      closedCaptionFile: closedCaptionFile,
      videoPlayerOptions: videoPlayerOptions,
      keys: keys,
    ));
  }

  /// Constructs a [VideoPlayerController] playing a video from obtained from the network.
  VideoPlayerController network(
    String dataSource, {
    VideoFormat? formatHint,
    Future<ClosedCaptionFile>? closedCaptionFile,
    VideoPlayerOptions? videoPlayerOptions,
    Map<String, String> httpHeaders = const {},
    List<Object?>? keys,
  }) {
    return use(_VideoPlayerControllerNetworkHook(
      dataSource,
      closedCaptionFile: closedCaptionFile,
      videoPlayerOptions: videoPlayerOptions,
      formatHint: formatHint,
      httpHeaders: httpHeaders,
      keys: keys,
    ));
  }
}

const useVideoPlayerController = _VideoPlayerControllerCreator();

class _VideoPlayerControllerAssetHook extends Hook<VideoPlayerController> {
  final String dataSource;
  final String? package;
  final Future<ClosedCaptionFile>? closedCaptionFile;
  final VideoPlayerOptions? videoPlayerOptions;

  _VideoPlayerControllerAssetHook(
    this.dataSource, {
    this.package,
    this.closedCaptionFile,
    this.videoPlayerOptions,
    List<Object?>? keys,
  }) : super(keys: keys);

  @override
  HookState<VideoPlayerController, Hook<VideoPlayerController>> createState() =>
      _VideoPlayerControllerAssetHookState();
}

class _VideoPlayerControllerAssetHookState
    extends HookState<VideoPlayerController, _VideoPlayerControllerAssetHook> {
  late VideoPlayerController videoPlayerController;

  @override
  void initHook() {
    super.initHook();
    videoPlayerController = VideoPlayerController.asset(
      hook.dataSource,
      closedCaptionFile: hook.closedCaptionFile,
      package: hook.package,
      videoPlayerOptions: hook.videoPlayerOptions,
    );
  }

  @override
  void didUpdateHook(_VideoPlayerControllerAssetHook oldHook) {
    if (oldHook.dataSource != hook.dataSource) {
      videoPlayerController.dispose();
      videoPlayerController = VideoPlayerController.asset(
        hook.dataSource,
        closedCaptionFile: hook.closedCaptionFile,
        package: hook.package,
        videoPlayerOptions: hook.videoPlayerOptions,
      );
    }
    super.didUpdateHook(oldHook);
  }

  @override
  VideoPlayerController build(BuildContext context) {
    return videoPlayerController;
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}

class _VideoPlayerControllerNetworkHook extends Hook<VideoPlayerController> {
  final String dataSource;
  final Future<ClosedCaptionFile>? closedCaptionFile;
  final VideoPlayerOptions? videoPlayerOptions;
  final VideoFormat? formatHint;
  final Map<String, String> httpHeaders;

  _VideoPlayerControllerNetworkHook(
    this.dataSource, {
    this.closedCaptionFile,
    this.videoPlayerOptions,
    this.formatHint,
    this.httpHeaders = const {},
    List<Object?>? keys,
  }) : super(keys: keys);

  @override
  HookState<VideoPlayerController, Hook<VideoPlayerController>> createState() =>
      _VideoPlayerControllerNetworkHookState();
}

class _VideoPlayerControllerNetworkHookState extends HookState<
    VideoPlayerController, _VideoPlayerControllerNetworkHook> {
  late VideoPlayerController videoPlayerController;

  @override
  void initHook() {
    super.initHook();
    videoPlayerController = VideoPlayerController.network(
      hook.dataSource,
      closedCaptionFile: hook.closedCaptionFile,
      videoPlayerOptions: hook.videoPlayerOptions,
      formatHint: hook.formatHint,
      httpHeaders: hook.httpHeaders,
    );
  }

  @override
  void didUpdateHook(_VideoPlayerControllerNetworkHook oldHook) {
    if (oldHook.dataSource != hook.dataSource) {
      videoPlayerController.dispose();
      videoPlayerController = VideoPlayerController.network(
        hook.dataSource,
        closedCaptionFile: hook.closedCaptionFile,
        videoPlayerOptions: hook.videoPlayerOptions,
        formatHint: hook.formatHint,
        httpHeaders: hook.httpHeaders,
      );
    }
    super.didUpdateHook(oldHook);
  }

  @override
  VideoPlayerController build(BuildContext context) {
    return videoPlayerController;
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
