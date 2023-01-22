import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:location/location.dart';

import 'package:native_video_view/native_video_view.dart';
import 'package:test_assignment/common/widget/show_message.dart';
import 'package:test_assignment/model/user/user_model.dart';
import 'package:test_assignment/model/video/video_model.dart';
import 'package:test_assignment/provider/camera_provider.dart';
import 'package:test_assignment/provider/input_text.dart';
import 'package:test_assignment/provider/location_provider.dart';
import 'package:test_assignment/utils/camera_helper.dart';
import 'package:test_assignment/utils/firestore_services.dart';
import 'package:test_assignment/utils/location_services.dart';
import 'package:test_assignment/utils/storage_services.dart';

import 'google_map_page.dart';

class AddPage extends ConsumerStatefulWidget {
  static var routeName = '/addPage';
  const AddPage({super.key});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  final TextEditingController _inputTitle = TextEditingController();
  final TextEditingController _inputUsername = TextEditingController();
  final TextEditingController _inputLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                onTap: () async {
                  final navigator = Navigator.of(context);
                  var locationServices = LocationService();

                  PermissionStatus permissionStatus =
                      await locationServices.getPermission();

                  switch (permissionStatus) {
                    case PermissionStatus.granted:
                      var locationValue = location.value;
                      if (locationValue != null) {
                        _inputLocation.text =
                            'Longitude : ${locationValue.longitude} dan Latitude : ${locationValue.latitude}';
                        ref.read(inputLocationProvider.notifier).state =
                            locationValue;

                        navigator.pushNamed(MapSample.routeName);
                      }
                      break;
                    case PermissionStatus.denied:
                      if (mounted) return;
                      showMessage(context, 'Permission denied');
                      break;
                    case PermissionStatus.deniedForever:
                      if (mounted) return;
                      showMessage(context, 'Permission denied forever');
                      break;
                    default:
                      break;
                  }
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
                    onPressed: () async {
                      var sendLocation = location.value;

                      var storageServices = StorageServices();
                      var urlVideo = await storageServices
                          .uploadVideo(ref.read(pathVideoProvider));
                      debugPrint(urlVideo.toString());

                      var userModel = UserModel().copyWith(
                          title: _inputTitle.text,
                          username: _inputUsername.text,
                          locationModel: sendLocation,
                          videoModel:
                              VideoModel().copyWith(videoLink: urlVideo));

                      var firebaseFirestore = FirestoreServices();
                      firebaseFirestore.nameCollection = 'users';
                      firebaseFirestore.addDataFirestore(userModel);
                    },
                    child: const Text('Send Data'))),
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
            debugPrint('Player Error ($what | $extra | $message)');
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
