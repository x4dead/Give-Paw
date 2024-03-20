import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/ui/pages/stories_page/widgets/video_control_overlay_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class StoriesPage extends ConsumerStatefulWidget {
  const StoriesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StoriesPageState();
}

class _StoriesPageState extends ConsumerState<StoriesPage> {
  late final player = Player();
  late final controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Playlist([
      // Media(
      //     'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
      // Media(
      //     'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
      // Media(
      //     'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
      // Media(
      //     'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
      Media(
          'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
      Media(
          'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
    ]));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Video(
            fill: AppColors.colorGray10,
            controls: getVideoController,
            controller: controller),
      ),
    );
  }

  Widget getVideoController(VideoState state) {
    return VideoControlOverlayWidget(controller: controller);
  }
}
