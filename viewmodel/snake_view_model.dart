// viewModel becomes the brain of the MVVM architecture
// viewModel as a state owner
// depends on BoardModel and SnakeModel

import '../model/board_model.dart';
import '../model/snake_model.dart';

class SnakeViewModel {
  BoardModel boardModel;
  SnakeModel snakeModel;

  SnakeViewModel({required this.boardModel, required this.snakeModel});
}
