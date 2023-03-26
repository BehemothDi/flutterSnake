// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ground.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Ground {
  List<Block> get grid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GroundCopyWith<Ground> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroundCopyWith<$Res> {
  factory $GroundCopyWith(Ground value, $Res Function(Ground) then) =
      _$GroundCopyWithImpl<$Res, Ground>;
  @useResult
  $Res call({List<Block> grid});
}

/// @nodoc
class _$GroundCopyWithImpl<$Res, $Val extends Ground>
    implements $GroundCopyWith<$Res> {
  _$GroundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grid = null,
  }) {
    return _then(_value.copyWith(
      grid: null == grid
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as List<Block>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GroundCopyWith<$Res> implements $GroundCopyWith<$Res> {
  factory _$$_GroundCopyWith(_$_Ground value, $Res Function(_$_Ground) then) =
      __$$_GroundCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Block> grid});
}

/// @nodoc
class __$$_GroundCopyWithImpl<$Res>
    extends _$GroundCopyWithImpl<$Res, _$_Ground>
    implements _$$_GroundCopyWith<$Res> {
  __$$_GroundCopyWithImpl(_$_Ground _value, $Res Function(_$_Ground) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grid = null,
  }) {
    return _then(_$_Ground(
      grid: null == grid
          ? _value._grid
          : grid // ignore: cast_nullable_to_non_nullable
              as List<Block>,
    ));
  }
}

/// @nodoc

class _$_Ground implements _Ground {
  const _$_Ground({required final List<Block> grid}) : _grid = grid;

  final List<Block> _grid;
  @override
  List<Block> get grid {
    if (_grid is EqualUnmodifiableListView) return _grid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grid);
  }

  @override
  String toString() {
    return 'Ground(grid: $grid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ground &&
            const DeepCollectionEquality().equals(other._grid, _grid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_grid));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroundCopyWith<_$_Ground> get copyWith =>
      __$$_GroundCopyWithImpl<_$_Ground>(this, _$identity);
}

abstract class _Ground implements Ground {
  const factory _Ground({required final List<Block> grid}) = _$_Ground;

  @override
  List<Block> get grid;
  @override
  @JsonKey(ignore: true)
  _$$_GroundCopyWith<_$_Ground> get copyWith =>
      throw _privateConstructorUsedError;
}
