import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/resources/app_images.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:media_kit_video/media_kit_video_controls/src/controls/methods/video_state.dart';

class VideoControlOverlayWidget extends ConsumerStatefulWidget {
  const VideoControlOverlayWidget({
    super.key,
    required VideoController controller,
  }) : _controller = controller;

  final VideoController _controller;

  @override
  ConsumerState<VideoControlOverlayWidget> createState() =>
      _VideoControlOverlayWidgetState();
}

class _VideoControlOverlayWidgetState
    extends ConsumerState<VideoControlOverlayWidget> {
  final visible = StateProvider((ref) => true);
  late final position =
      StateProvider((ref) => controller(context).player.state.position);

  final transitionDuration = const Duration(milliseconds: 150);
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onLongPressStart: (details) {
          // _timer = Timer(transitionDuration, () {
          ref.read(visible.notifier).state = false;
          widget._controller.player.pause();
          // });
        },
        onLongPressEnd: (details) {
          _timer = Timer(transitionDuration, () {
            ref.read(visible.notifier).state = true;
            widget._controller.player.play();
          });
        },
        onTap: () {
          widget._controller.player.playOrPause();
        },
        child: AnimatedOpacity(
          curve: Curves.easeInOut,
          opacity: ref.watch(visible) ? 1.0 : 0.0,
          duration: transitionDuration,
          child: Stack(
            children: [
              Padding(
                padding: kPH20V12,
                child: Column(children: [
                  SeekBar(position: position, margin: EdgeInsets.zero),
                  kSBH8,
                  SizedBox(
                    width: double.infinity,
                    height: 36,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'Дай Лапу',
                          style: AppTextStyle.w600s20
                              .copyWith(color: AppColors.colorWhite),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            icon: SvgPicture.asset(
                              AppImages.iosArrowLeft,
                              colorFilter:
                                  svgColorFilter(color: AppColors.colorWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final isSliderClicked = StateProvider((ref) => false);

class SeekBar extends ConsumerStatefulWidget {
  final VoidCallback? onSeekStart;
  final VoidCallback? onSeekEnd;
  final EdgeInsetsGeometry margin;
  final StateProvider<Duration> position;

  const SeekBar({
    super.key,
    required this.position,
    this.onSeekStart,
    this.onSeekEnd,
    this.margin = const EdgeInsets.all(8),
  });

  @override
  SeekBarConsumerState createState() => SeekBarConsumerState();
}

class SeekBarConsumerState extends ConsumerState<SeekBar> {
  // final listPlayer = [];
  final videoSlider = StateProvider((ref) => 0.0);

  late Duration duration = controller(context).player.state.duration;
  final List<StreamSubscription> subscriptions = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (subscriptions.isEmpty) {
      subscriptions.addAll(
        [
          controller(context).player.stream.position.
              //  stream.completed.
              listen((event) {
            ref.read(widget.position.notifier).state = Duration.zero;
          }),
          controller(context).player.stream.position.listen((event) {
            if (!ref.watch(isSliderClicked)) {
              ref.read(widget.position.notifier).state = event;
            }
          }),
          controller(context).player.stream.duration.listen((event) {
            // ref.read(
            duration
                // .notifier).state
                = event;
          }),
        ],
      );
    }
  }

  @override
  void dispose() {
    for (final subscription in subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  void onPointerMove(
      PointerMoveEvent e, BoxConstraints constraints, WidgetRef ref) {
    final percent = e.localPosition.dx / constraints.maxWidth;

    ref.read(videoSlider.notifier).state = percent.clamp(0.0, 1.0);
  }

  void onPointerDown(
      PointerDownEvent e, BoxConstraints constraints, WidgetRef ref) {
    widget.onSeekStart?.call();

    ref.read(isSliderClicked.notifier).state = true;
    ref.read(videoSlider.notifier).state =
        (e.localPosition.dx / constraints.maxWidth).clamp(0.0, 1.0);
  }

  void onPointerUp(WidgetRef ref) {
    widget.onSeekEnd?.call();
    ref.read(isSliderClicked.notifier).state = false;
    controller(context).player.seek(duration * ref.watch(videoSlider));

    ref.read(widget.position.notifier).state =
        duration * ref.watch(videoSlider);
  }

  double get positionPercent {
    if (ref.watch(widget.position) == Duration.zero ||
        duration == Duration.zero) {
      return 0.0;
    } else {
      final value =
          ref.watch(widget.position).inMilliseconds / duration.inMilliseconds;
      return value.clamp(0.0, 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final playlistLength =
        controller(context).player.state.playlist.medias.length;

    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth / playlistLength -
          (playlistLength > 1 ? (6.5 / (playlistLength - 1)) : 0);

      return Container(
        clipBehavior: Clip.none,
        margin: widget.margin,
        width: constraints.maxWidth,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(playlistLength, (index) {
            return Listener(
              // onPointerMove: (e) => onPointerMove(e, constraints, ref),
              // onPointerDown: (e) => onPointerDown(e, constraints, ref),
              // onPointerUp: (e) => onPointerUp(ref),
              child: SizedBox(
                // color: Colors.transparent,
                // width: constraints.maxWidth
                // /
                //     controller(context).player.state.playlist.medias.length
                // ,
                height: 4,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: width,
                      height: 4,
                      alignment: Alignment.centerLeft,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite.withOpacity(0.5),
                        borderRadius: index == 0 && playlistLength > 1
                            ? const BorderRadius.horizontal(
                                right: Radius.circular(4))
                            : const BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: ref.watch(isSliderClicked)
                                ? width * ref.watch(videoSlider)
                                : width * positionPercent,
                            color: AppColors.colorWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
