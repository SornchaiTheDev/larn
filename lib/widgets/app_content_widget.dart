import 'package:flutter/material.dart';
import 'package:larn/store/settings_store.dart';
import 'package:larn/widgets/home_content_widget.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class AppContentWidget extends StatefulWidget {
  const AppContentWidget({
    super.key,
    required this.onNext,
    required this.onPrev,
  });

  final VoidCallback onPrev;
  final VoidCallback onNext;

  @override
  State<AppContentWidget> createState() => _AppContentWidgetState();
}

class _AppContentWidgetState extends State<AppContentWidget> {
  late VideoPlayerController _controller;
  bool isVolumeOn = true;
  double _currentPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"))
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      })
      ..addListener(() {
        setState(() {
          _currentPosition = _controller.value.position.inSeconds.toDouble();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.setLooping(true);

    double bodyfontsize = Provider.of<SettingStore>(context).bodyFontSize;
    double subheadingFontSize =
        Provider.of<SettingStore>(context).subHeadingFontSize;

    bool isVideoLoaded = _controller.value.isInitialized;

    return HomeContentWidget(
      onNext: widget.onNext,
      onPrev: widget.onPrev,
      isVolumeOn: isVolumeOn,
      onVolumeToggle: () => setState(() {
        isVolumeOn = !isVolumeOn;
        _controller.setVolume(isVolumeOn ? 1.0 : 0.0);
      }),
      topLeft: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://static-00.iconduck.com/assets.00/netflix-icon-icon-2048x2048-yj41gpvr.png",
            width: 80,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "แนะนำ",
                style: TextStyle(fontSize: bodyfontsize),
              ),
              Text(
                "Netflix",
                style: TextStyle(
                  fontSize: subheadingFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
      content: Stack(
        children: [
          isVideoLoaded
              ? Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -24),
                        child: _buildSeekBar(),
                      ),
                    ],
                  ),
                )
              : const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }

  Widget _buildSeekBar() {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 4,
        thumbColor: Theme.of(context).primaryColor,
        activeTrackColor: Theme.of(context).primaryColor,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
      ),
      child: Slider(
        value: _currentPosition,
        min: 0.0,
        max: _controller.value.duration.inSeconds.toDouble(),
        onChanged: (value) {
          setState(() {
            _controller.seekTo(Duration(seconds: value.toInt()));
            _currentPosition = value;
          });
        },
      ),
    );
  }
}
