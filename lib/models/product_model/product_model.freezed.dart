// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationModel {
  int? get total => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  bool? get perviousPage => throw _privateConstructorUsedError;
  bool? get nextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res, PaginationModel>;
  @useResult
  $Res call(
      {int? total, int? page, int? limit, bool? perviousPage, bool? nextPage});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res, $Val extends PaginationModel>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? perviousPage = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      perviousPage: freezed == perviousPage
          ? _value.perviousPage
          : perviousPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationModelImplCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$$PaginationModelImplCopyWith(_$PaginationModelImpl value,
          $Res Function(_$PaginationModelImpl) then) =
      __$$PaginationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total, int? page, int? limit, bool? perviousPage, bool? nextPage});
}

/// @nodoc
class __$$PaginationModelImplCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res, _$PaginationModelImpl>
    implements _$$PaginationModelImplCopyWith<$Res> {
  __$$PaginationModelImplCopyWithImpl(
      _$PaginationModelImpl _value, $Res Function(_$PaginationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
    Object? perviousPage = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_$PaginationModelImpl(
      freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == perviousPage
          ? _value.perviousPage
          : perviousPage // ignore: cast_nullable_to_non_nullable
              as bool?,
      freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationModelImpl implements _PaginationModel {
  const _$PaginationModelImpl(
      this.total, this.page, this.limit, this.perviousPage, this.nextPage);

  factory _$PaginationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationModelImplFromJson(json);

  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? limit;
  @override
  final bool? perviousPage;
  @override
  final bool? nextPage;

  @override
  String toString() {
    return 'PaginationModel(total: $total, page: $page, limit: $limit, perviousPage: $perviousPage, nextPage: $nextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.perviousPage, perviousPage) ||
                other.perviousPage == perviousPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, page, limit, perviousPage, nextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      __$$PaginationModelImplCopyWithImpl<_$PaginationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationModelImplToJson(
      this,
    );
  }
}

abstract class _PaginationModel implements PaginationModel {
  const factory _PaginationModel(
      final int? total,
      final int? page,
      final int? limit,
      final bool? perviousPage,
      final bool? nextPage) = _$PaginationModelImpl;

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$PaginationModelImpl.fromJson;

  @override
  int? get total;
  @override
  int? get page;
  @override
  int? get limit;
  @override
  bool? get perviousPage;
  @override
  bool? get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return _DataModel.fromJson(json);
}

/// @nodoc
mixin _$DataModel {
  PaginationModel? get pagination => throw _privateConstructorUsedError;
  List<ProductModel>? get docs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataModelCopyWith<DataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataModelCopyWith<$Res> {
  factory $DataModelCopyWith(DataModel value, $Res Function(DataModel) then) =
      _$DataModelCopyWithImpl<$Res, DataModel>;
  @useResult
  $Res call({PaginationModel? pagination, List<ProductModel>? docs});

  $PaginationModelCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$DataModelCopyWithImpl<$Res, $Val extends DataModel>
    implements $DataModelCopyWith<$Res> {
  _$DataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = freezed,
    Object? docs = freezed,
  }) {
    return _then(_value.copyWith(
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
      docs: freezed == docs
          ? _value.docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationModelCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataModelImplCopyWith<$Res>
    implements $DataModelCopyWith<$Res> {
  factory _$$DataModelImplCopyWith(
          _$DataModelImpl value, $Res Function(_$DataModelImpl) then) =
      __$$DataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginationModel? pagination, List<ProductModel>? docs});

  @override
  $PaginationModelCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$DataModelImplCopyWithImpl<$Res>
    extends _$DataModelCopyWithImpl<$Res, _$DataModelImpl>
    implements _$$DataModelImplCopyWith<$Res> {
  __$$DataModelImplCopyWithImpl(
      _$DataModelImpl _value, $Res Function(_$DataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = freezed,
    Object? docs = freezed,
  }) {
    return _then(_$DataModelImpl(
      freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginationModel?,
      freezed == docs
          ? _value._docs
          : docs // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataModelImpl implements _DataModel {
  const _$DataModelImpl(this.pagination, final List<ProductModel>? docs)
      : _docs = docs;

  factory _$DataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataModelImplFromJson(json);

  @override
  final PaginationModel? pagination;
  final List<ProductModel>? _docs;
  @override
  List<ProductModel>? get docs {
    final value = _docs;
    if (value == null) return null;
    if (_docs is EqualUnmodifiableListView) return _docs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DataModel(pagination: $pagination, docs: $docs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataModelImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            const DeepCollectionEquality().equals(other._docs, _docs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pagination, const DeepCollectionEquality().hash(_docs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataModelImplCopyWith<_$DataModelImpl> get copyWith =>
      __$$DataModelImplCopyWithImpl<_$DataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataModelImplToJson(
      this,
    );
  }
}

abstract class _DataModel implements DataModel {
  const factory _DataModel(
          final PaginationModel? pagination, final List<ProductModel>? docs) =
      _$DataModelImpl;

  factory _DataModel.fromJson(Map<String, dynamic> json) =
      _$DataModelImpl.fromJson;

  @override
  PaginationModel? get pagination;
  @override
  List<ProductModel>? get docs;
  @override
  @JsonKey(ignore: true)
  _$$DataModelImplCopyWith<_$DataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
