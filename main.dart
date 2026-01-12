// Wiring only - only wires the dependancies
// MVVM architecture
// correct Dependancy Injection

import 'core/app_provider.dart';
// import 'model/direction_model.dart';

void main() {
  // final view = consoleViewProvider.get();
  // final viewModel = snakeViewProvider.get();
  // view.renderBoard(viewModel);

  // print('\n right \n');
  // viewModel.moveSnake(DirectionModel.right);
  // view.renderBoard(viewModel);

  final gameLoop = gameLoopProvider.get();
  gameLoop.start();
}
