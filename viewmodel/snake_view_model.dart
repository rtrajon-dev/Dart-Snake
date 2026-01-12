// viewModel becomes the brain of the MVVM architecture
// viewModel as a state owner
// depends on BoaSnakeModel

import 'dart:math';

import '../model/board_model.dart';
import '../model/direction_model.dart';
import '../model/food_model.dart';
import '../model/point_model.dart';
import '../model/snake_model.dart';

class SnakeViewModel {
  final BoardModel boardModel;
  final SnakeModel snakeModel;
  final FoodModel foodModel;

  bool _gameOver = false;
  bool get isGameOver => _gameOver;
  bool _shouldGrow = false;

  SnakeViewModel({
    required this.boardModel,
    required this.snakeModel,
    required this.foodModel,
  });

  void moveSnake(DirectionModel direction) {
    if (isGameOver) return;

    final currentHead = snakeModel.head;
    late PointModel next;

    switch (direction) {
      case DirectionModel.up:
        next = PointModel(x: currentHead.x, y: currentHead.y - 1);
        break;
      case DirectionModel.down:
        next = PointModel(x: currentHead.x, y: currentHead.y + 1);
        break;
      case DirectionModel.left:
        next = PointModel(x: currentHead.x - 1, y: currentHead.y);
        break;
      case DirectionModel.right:
        next = PointModel(x: currentHead.x + 1, y: currentHead.y);
        break;
    }

    void _spawnFood() {
      final random = Random();
      PointModel p;

      do {
        p = PointModel(
          x: random.nextInt(boardModel.width - 2) + 1,
          y: random.nextInt(boardModel.height - 2) + 1,
        );
      } while (snakeModel.body.any((b) => b.x == p.x && b.y == p.y));
      foodModel.position = p;
    }

    //boundary check
    if (!boardModel.containsPoint(next.x, next.y)) {
      _gameOver = true;
      return;
    }
    //self collision
    if (snakeModel.body.any((p) => p.x == next.x && p.y == next.y)) {
      _gameOver = true;
    }

    // Food eat
    if (next.x == foodModel.position.x && next.y == foodModel.position.y) {
      _shouldGrow = true;
      _spawnFood();
    }

    snakeModel.body.insert(0, next);

    if (!_shouldGrow) {
      snakeModel.body.removeLast();
    } else {
      _shouldGrow = false;
    }
  }
}
