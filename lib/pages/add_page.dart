import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:native_video_view/native_video_view.dart';
import 'package:test_assignment/provider/camera_provider.dart';
import 'package:test_assignment/utils/camera_helper.dart';

class AddPage extends ConsumerStatefulWidget {
  static var routeName = '/addPage';
  AddPage({super.key});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test Assignment'),
        ),
        body: Center(
            child: Column(children: [
          _uiVideo(ref.watch(pathVideoProvider)),
          SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: ElevatedButton(
                  onPressed: () async {
                    ref.read(pathVideoProvider.notifier).state = '';

                    var openCamera = await CameraHelper.openCamera();

                    ref.read(pathVideoProvider.notifier).state =
                        openCamera[0].path.toString();
                    debugPrint('Path ${ref.watch(pathVideoProvider)}');
                  },
                  child: const Text('Get Video')))
        ])));
  }

  _uiVideo(String path) {
    if (path == 'add_image') {
      return Container(
        margin: EdgeInsets.all(8),
        width: double.infinity,
        height: 300,
        child: SvgPicture.asset("asset/image/ic_video.svg"),
      );
    } else if (path.isEmpty) {
      return Container(
        margin: EdgeInsets.all(8),
        width: double.infinity,
        color: Colors.black,
        height: 300,
      );
    } else {
      return Container(
        margin: EdgeInsets.all(8),
        width: double.infinity,
        height: 300,
        child: NativeVideoView(
          showMediaController: true,
          autoHide: true,
          onCreated: (controller) {
            debugPrint('Path Create${ref.watch(pathVideoProvider)}');
            controller.setVideoSource(
              path,
              sourceType: VideoSourceType.file,
            );
          },
          onPrepared: (controller, info) {
            controller.play();
          },
          onError: (controller, what, extra, message) {
            print('Player Error ($what | $extra | $message)');
          },
          onCompletion: (controller) {
            debugPrint('Video completed');
          },
          onProgress: (progress, duration) {
            debugPrint('$progress | $duration');
          },
        ),
      );
    }
  }
}
