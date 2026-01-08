// Wiring only - only wires the dependancies
// MVVM architecture
// correct Dependancy Injection

import 'model/board_model.dart';
import 'model/point_model.dart';
import 'model/snake_model.dart';
import 'view/console_view.dart';
import 'viewmodel/snake_view_model.dart';

void main() {
  final board = BoardModel(height: 5, width: 20);
  final snake = SnakeModel(head: PointModel(x: 2, y: 3));
  final viewModel = SnakeViewModel(boardModel: board, snakeModel: snake);
  final view = ConsoleView();

  view.renderBoard(viewModel);
}
