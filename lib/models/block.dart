import 'package:freezed_annotation/freezed_annotation.dart';

part 'block.freezed.dart';

enum BlockType {
  blank,
  snake,
  food,
  wall,
}

@freezed
class Block with _$Block {
  const factory Block({
    required BlockType type,
  }) = _Block;
}
