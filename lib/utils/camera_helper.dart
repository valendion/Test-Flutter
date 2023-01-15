import 'package:images_picker/images_picker.dart';

class CameraHelper {
  static Future<List<Media>> getVideo() async {
    List<Media>? res = await ImagesPicker.pick(
      language: Language.English,
      quality: 0.8,
      count: 1,
      pickType: PickType.video,
    );
    return res ?? [];
// Media
// .path
// .thumbPath (path for video thumb)
// .size (kb)
  }

  static Future<List<Media>> openCamera() async {
    var getVideo = await ImagesPicker.openCamera(
      pickType: PickType.video,
      maxTime: 15, // record video max time
    );

    return getVideo ?? [];
  }
}
