import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:images_picker/images_picker.dart';
import 'package:location/location.dart';

import 'package:native_video_view/native_video_view.dart';
import 'package:test_assignment/provider/camera_provider.dart';
import 'package:test_assignment/provider/input_text.dart';
import 'package:test_assignment/provider/location_provider.dart';
import 'package:test_assignment/utils/camera_helper.dart';

import 'google_map_page.dart';

class AddPage extends ConsumerStatefulWidget {
  static var routeName = '/addPage';
  AddPage({super.key});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  final TextEditingController _inputTitle = TextEditingController();
  final TextEditingController _inputUsername = TextEditingController();
  final TextEditingController _inputLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pemissionLocation = ref.watch(permissionLocationProvider);
    var location = ref.watch(locationProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test Assignment'),
        ),
        body: SingleChildScrollView(
          child: Center(
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
                    child: const Text('Get Video'))),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                controller: _inputTitle,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Title  video'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: _inputUsername,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                controller: _inputLocation,
                keyboardType: TextInputType.none,
                onTap: () {
                  pemissionLocation.when(
                      data: ((data) {
                        switch (data) {
                          case PermissionStatus.granted:
                            location.when(
                                data: ((data) {
                                  _inputLocation.text =
                                      'Longitude : ${data.longitude} dan Latitude : ${data.latitude}';
                                  ref
                                      .read(inputLocationProvider.notifier)
                                      .state = data;
                                  Navigator.pushNamed(
                                      context, MapSample.routeName);
                                }),
                                error: ((error, stackTrace) {}),
                                loading: () {
                                  const CircularProgressIndicator();
                                });
                            break;
                          default:
                        }
                      }),
                      error: (error, stack) {},
                      loading: () {
                        const CircularProgressIndicator();
                      });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Location'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                    onPressed: () async {}, child: const Text('Send Data'))),
          ])),
        ));
  }

  _uiVideo(String path) {
    if (path == 'add_image') {
      return Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        height: 300,
        child: SvgPicture.asset("asset/image/ic_video.svg"),
      );
    } else if (path.isEmpty) {
      return Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        color: Colors.black,
        height: 300,
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(8),
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _inputLocation.dispose();
    _inputTitle.dispose();
    _inputUsername.dispose();
  }
}
