class Level {
  final int rows;
  final int columns;
  late final int area;

  Level({
    required this.rows,
    required this.columns,
  }) : area = rows * columns;
}
