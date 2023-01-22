// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map json) => _$_UserModel(
      title: json['title'] as String? ?? '',
      username: json['username'] as String? ?? '',
      locationModel: json['locationModel'] == null
          ? null
          : LocationModel.fromJson(
              Map<String, dynamic>.from(json['locationModel'] as Map)),
      videoModel: json['videoModel'] == null
          ? null
          : VideoModel.fromJson(
              Map<String, dynamic>.from(json['videoModel'] as Map)),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'username': instance.username,
      'locationModel': instance.locationModel?.toJson(),
      'videoModel': instance.videoModel?.toJson(),
    };
