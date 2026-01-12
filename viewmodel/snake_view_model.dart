// viewModel becomes the brain of the MVVM architecture
// viewModel as a state owner
// depends on BoaSnakeModel

import '../model/board_model.dart';
import '../model/direction_model.dart';
import '../model/point_model.dart';
import '../model/snake_model.dart';

class SnakeViewModel {
  BoardModel boardModel;
  SnakeModel snakeModel;
  bool _gameOver = false;
  bool get isGameOver => _gameOver;

  SnakeViewModel({required this.boardModel, required this.snakeModel});

  void moveSnake(DirectionModel direction) {
    if (isGameOver) return;

    final current = snakeModel.head;
    PointModel next;

    switch (direction) {
      case DirectionModel.up:
        next = PointModel(x: current.x, y: current.y - 1);
        break;
      case DirectionModel.down:
        next = PointModel(x: current.x, y: current.y + 1);
        break;
      case DirectionModel.left:
        next = PointModel(x: current.x - 1, y: current.y);
        break;
      case DirectionModel.right:
        next = PointModel(x: current.x + 1, y: current.y);
        break;
    }
    snakeModel.head = next;

    if (!boardModel.containsPoint(next.x, next.y)) {
      _gameOver = true;
      return;
    }
  }
}
