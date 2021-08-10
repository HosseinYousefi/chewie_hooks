import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

ChewieController useChewieController({
  Widget Function(BuildContext context, String subtitle)? subtitleBuilder,
  Subtitles? subtitle,
  required VideoPlayerController videoPlayerController,
  bool autoInitialize = false,
  bool autoPlay = false,
  Duration? startAt,
  bool looping = false,
  bool showControlsOnInitialize = true,
  bool showControls = true,
  Widget? customControls,
  Widget Function(BuildContext context, String errorMessage)? errorBuilder,
  double? aspectRatio,
  ChewieProgressColors? cupertinoProgressColors,
  ChewieProgressColors? materialProgressColors,
  Widget? placeholder,
  Widget? overlay,
  bool fullScreenByDefault = false,
  bool allowedScreenSleep = true,
  bool isLive = false,
  bool allowFullScreen = true,
  bool allowMuting = true,
  bool allowPlaybackSpeedChanging = true,
  List<double> playbackSpeeds = const [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2],
  List<SystemUiOverlay>? systemOverlaysOnEnterFullScreen,
  List<DeviceOrientation>? deviceOrientationsOnEnterFullScreen,
  List<SystemUiOverlay> systemOverlaysAfterFullScreen = SystemUiOverlay.values,
  List<DeviceOrientation> deviceOrientationsAfterFullScreen =
      DeviceOrientation.values,
  ChewieRoutePageBuilder? routePageBuilder,
}) {
  return use(_ChewieControllerHook(
    videoPlayerController: videoPlayerController,
    allowFullScreen: allowFullScreen,
    allowMuting: allowMuting,
    allowPlaybackSpeedChanging: allowPlaybackSpeedChanging,
    allowedScreenSleep: allowedScreenSleep,
    aspectRatio: aspectRatio,
    autoInitialize: autoInitialize,
    autoPlay: autoPlay,
    cupertinoProgressColors: cupertinoProgressColors,
    customControls: customControls,
    deviceOrientationsAfterFullScreen: deviceOrientationsAfterFullScreen,
    deviceOrientationsOnEnterFullScreen: deviceOrientationsOnEnterFullScreen,
    errorBuilder: errorBuilder,
    fullScreenByDefault: fullScreenByDefault,
    isLive: isLive,
    looping: looping,
    materialProgressColors: materialProgressColors,
    overlay: overlay,
    placeholder: placeholder,
    playbackSpeeds: playbackSpeeds,
    routePageBuilder: routePageBuilder,
    showControls: showControls,
    showControlsOnInitialize: showControlsOnInitialize,
    startAt: startAt,
    subtitle: subtitle,
    subtitleBuilder: subtitleBuilder,
    systemOverlaysAfterFullScreen: systemOverlaysAfterFullScreen,
    systemOverlaysOnEnterFullScreen: systemOverlaysOnEnterFullScreen,
  ));
}

class _ChewieControllerHook extends Hook<ChewieController> {
  final Widget Function(BuildContext context, String subtitle)? subtitleBuilder;

  final Subtitles? subtitle;

  /// The controller for the video you want to play
  final VideoPlayerController videoPlayerController;

  /// Initialize the Video on Startup. This will prep the video for playback.
  final bool autoInitialize;

  /// Play the video as soon as it's displayed
  final bool autoPlay;

  /// Start video at a certain position
  final Duration? startAt;

  /// Whether or not the video should loop
  final bool looping;

  /// Weather or not to show the controls when initializing the widget.
  final bool showControlsOnInitialize;

  /// Whether or not to show the controls at all
  final bool showControls;

  /// Defines customised controls. Check [MaterialControls] or
  /// [CupertinoControls] for reference.
  final Widget? customControls;

  /// When the video playback runs into an error, you can build a custom
  /// error message.
  final Widget Function(BuildContext context, String errorMessage)?
      errorBuilder;

  /// The Aspect Ratio of the Video. Important to get the correct size of the
  /// video!
  ///
  /// Will fallback to fitting within the space allowed.
  final double? aspectRatio;

  /// The colors to use for controls on iOS. By default, the iOS player uses
  /// colors sampled from the original iOS 11 designs.
  final ChewieProgressColors? cupertinoProgressColors;

  /// The colors to use for the Material Progress Bar. By default, the Material
  /// player uses the colors from your Theme.
  final ChewieProgressColors? materialProgressColors;

  /// The placeholder is displayed underneath the Video before it is initialized
  /// or played.
  final Widget? placeholder;

  /// A widget which is placed between the video and the controls
  final Widget? overlay;

  /// Defines if the player will start in fullscreen when play is pressed
  final bool fullScreenByDefault;

  /// Defines if the player will sleep in fullscreen or not
  final bool allowedScreenSleep;

  /// Defines if the controls should be for live stream video
  final bool isLive;

  /// Defines if the fullscreen control should be shown
  final bool allowFullScreen;

  /// Defines if the mute control should be shown
  final bool allowMuting;

  /// Defines if the playback speed control should be shown
  final bool allowPlaybackSpeedChanging;

  /// Defines the set of allowed playback speeds user can change
  final List<double> playbackSpeeds;

  /// Defines the system overlays visible on entering fullscreen
  final List<SystemUiOverlay>? systemOverlaysOnEnterFullScreen;

  /// Defines the set of allowed device orientations on entering fullscreen
  final List<DeviceOrientation>? deviceOrientationsOnEnterFullScreen;

  /// Defines the system overlays visible after exiting fullscreen
  final List<SystemUiOverlay> systemOverlaysAfterFullScreen;

  /// Defines the set of allowed device orientations after exiting fullscreen
  final List<DeviceOrientation> deviceOrientationsAfterFullScreen;

  /// Defines a custom RoutePageBuilder for the fullscreen
  final ChewieRoutePageBuilder? routePageBuilder;

  _ChewieControllerHook({
    required this.videoPlayerController,
    this.aspectRatio,
    this.autoInitialize = false,
    this.autoPlay = false,
    this.startAt,
    this.looping = false,
    this.fullScreenByDefault = false,
    this.cupertinoProgressColors,
    this.materialProgressColors,
    this.placeholder,
    this.overlay,
    this.showControlsOnInitialize = true,
    this.showControls = true,
    this.subtitle,
    this.subtitleBuilder,
    this.customControls,
    this.errorBuilder,
    this.allowedScreenSleep = true,
    this.isLive = false,
    this.allowFullScreen = true,
    this.allowMuting = true,
    this.allowPlaybackSpeedChanging = true,
    this.playbackSpeeds = const [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2],
    this.systemOverlaysOnEnterFullScreen,
    this.deviceOrientationsOnEnterFullScreen,
    this.systemOverlaysAfterFullScreen = SystemUiOverlay.values,
    this.deviceOrientationsAfterFullScreen = DeviceOrientation.values,
    this.routePageBuilder,
  });

  @override
  HookState<ChewieController, Hook<ChewieController>> createState() =>
      _ChewieControllerHookState();
}

class _ChewieControllerHookState
    extends HookState<ChewieController, _ChewieControllerHook> {
  late ChewieController chewieController;

  void _createChewieController() {
    chewieController = ChewieController(
      videoPlayerController: hook.videoPlayerController,
      allowFullScreen: hook.allowFullScreen,
      allowMuting: hook.allowMuting,
      allowPlaybackSpeedChanging: hook.allowPlaybackSpeedChanging,
      allowedScreenSleep: hook.allowedScreenSleep,
      aspectRatio: hook.aspectRatio,
      autoInitialize: hook.autoInitialize,
      autoPlay: hook.autoPlay,
      cupertinoProgressColors: hook.cupertinoProgressColors,
      customControls: hook.customControls,
      deviceOrientationsAfterFullScreen: hook.deviceOrientationsAfterFullScreen,
      deviceOrientationsOnEnterFullScreen:
          hook.deviceOrientationsOnEnterFullScreen,
      errorBuilder: hook.errorBuilder,
      fullScreenByDefault: hook.fullScreenByDefault,
      isLive: hook.isLive,
      looping: hook.looping,
      materialProgressColors: hook.materialProgressColors,
      overlay: hook.overlay,
      placeholder: hook.placeholder,
      playbackSpeeds: hook.playbackSpeeds,
      routePageBuilder: hook.routePageBuilder,
      showControls: hook.showControls,
      showControlsOnInitialize: hook.showControlsOnInitialize,
      startAt: hook.startAt,
      subtitle: hook.subtitle,
      subtitleBuilder: hook.subtitleBuilder,
      systemOverlaysAfterFullScreen: hook.systemOverlaysAfterFullScreen,
      systemOverlaysOnEnterFullScreen: hook.systemOverlaysOnEnterFullScreen,
    );
  }

  @override
  void initHook() {
    super.initHook();
    _createChewieController();
  }

  @override
  void didUpdateHook(_ChewieControllerHook oldHook) {
    if (oldHook.videoPlayerController.dataSource !=
        hook.videoPlayerController.dataSource) {
      chewieController.dispose();
      _createChewieController();
    }
    super.didUpdateHook(oldHook);
  }

  @override
  ChewieController build(BuildContext context) {
    return chewieController;
  }

  @override
  void dispose() {
    chewieController.dispose();
    super.dispose();
  }
}
