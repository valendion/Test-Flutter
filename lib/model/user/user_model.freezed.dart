// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get title => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  LocationModel? get locationModel => throw _privateConstructorUsedError;
  VideoModel? get videoModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String title,
      String username,
      LocationModel? locationModel,
      VideoModel? videoModel});

  $LocationModelCopyWith<$Res>? get locationModel;
  $VideoModelCopyWith<$Res>? get videoModel;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? username = null,
    Object? locationModel = freezed,
    Object? videoModel = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      locationModel: freezed == locationModel
          ? _value.locationModel
          : locationModel // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      videoModel: freezed == videoModel
          ? _value.videoModel
          : videoModel // ignore: cast_nullable_to_non_nullable
              as VideoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get locationModel {
    if (_value.locationModel == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.locationModel!, (value) {
      return _then(_value.copyWith(locationModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VideoModelCopyWith<$Res>? get videoModel {
    if (_value.videoModel == null) {
      return null;
    }

    return $VideoModelCopyWith<$Res>(_value.videoModel!, (value) {
      return _then(_value.copyWith(videoModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String username,
      LocationModel? locationModel,
      VideoModel? videoModel});

  @override
  $LocationModelCopyWith<$Res>? get locationModel;
  @override
  $VideoModelCopyWith<$Res>? get videoModel;
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? username = null,
    Object? locationModel = freezed,
    Object? videoModel = freezed,
  }) {
    return _then(_$_UserModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      locationModel: freezed == locationModel
          ? _value.locationModel
          : locationModel // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      videoModel: freezed == videoModel
          ? _value.videoModel
          : videoModel // ignore: cast_nullable_to_non_nullable
              as VideoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {this.title = '',
      this.username = '',
      this.locationModel,
      this.videoModel});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String username;
  @override
  final LocationModel? locationModel;
  @override
  final VideoModel? videoModel;

  @override
  String toString() {
    return 'UserModel(title: $title, username: $username, locationModel: $locationModel, videoModel: $videoModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.locationModel, locationModel) ||
                other.locationModel == locationModel) &&
            (identical(other.videoModel, videoModel) ||
                other.videoModel == videoModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, username, locationModel, videoModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {final String title,
      final String username,
      final LocationModel? locationModel,
      final VideoModel? videoModel}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get title;
  @override
  String get username;
  @override
  LocationModel? get locationModel;
  @override
  VideoModel? get videoModel;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
