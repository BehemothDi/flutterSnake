import 'package:freezed_annotation/freezed_annotation.dart';

import 'block.dart';

part 'ground.freezed.dart';

@freezed
class Ground with _$Ground {
  const factory Ground({
    required List<Block> grid,
  }) = _Ground;
}
