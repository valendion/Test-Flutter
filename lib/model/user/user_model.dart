import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';
import 'package:test_assignment/model/location/location_model.dart';
import 'package:test_assignment/model/video/video_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {@Default('') String title,
      @Default('') String username,
      LocationModel? locationModel,
      VideoModel? videoModel}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
