// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      title: json['title'] as String? ?? '',
      username: json['username'] as String? ?? '',
      locationModel: json['locationModel'] == null
          ? null
          : LocationModel.fromJson(
              json['locationModel'] as Map<String, dynamic>),
      videoModel: json['videoModel'] == null
          ? null
          : VideoModel.fromJson(json['videoModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'username': instance.username,
      'locationModel': instance.locationModel,
      'videoModel': instance.videoModel,
    };
