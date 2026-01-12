// Provider depends on other Providers

import '../model/board_model.dart';
import '../model/point_model.dart';
import '../model/snake_model.dart';
import '../view/console_view.dart';
import '../viewmodel/snake_view_model.dart';
import 'game_loop.dart';
import 'provider.dart';

final boardProvider = Provider<BoardModel>(
  () => BoardModel(height: 8, width: 20),
);

final snakeProvider = Provider<SnakeModel>(
  () => SnakeModel([
    PointModel(x: 5, y: 3),
    PointModel(x: 4, y: 3),
    PointModel(x: 3, y: 3),
  ]),
);

final snakeViewProvider = Provider<SnakeViewModel>(
  () => SnakeViewModel(
    boardModel: boardProvider.get(),
    snakeModel: snakeProvider.get(),
  ),
);

final gameLoopProvider = Provider<GameLoop>(
  () => GameLoop(
    viewModel: snakeViewProvider.get(),
    renderView: (vm) {
      consoleViewProvider.get().renderBoard(vm);
    },
  ),
);

final consoleViewProvider = Provider<ConsoleView>(() => ConsoleView());
