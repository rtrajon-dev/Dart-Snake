// Provider depends on other Providers

import '../lib/input/input_controller.dart';
import '../lib/input/keyboard_input_controller.dart';
import '../model/board_model.dart';
import '../model/food_model.dart';
import '../model/point_model.dart';
import '../model/score_model.dart';
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

final foodProvider = Provider<FoodModel>(
  () => FoodModel(const PointModel(x: 7, y: 3)),
);

final inputProvider = Provider<InputController>(
  () => KeyboardInputController(),
);

final scoreProvider = Provider<ScoreModel>(() => ScoreModel(0));

final snakeViewProvider = Provider<SnakeViewModel>(
  () => SnakeViewModel(
    boardModel: boardProvider.get(),
    snakeModel: snakeProvider.get(),
    foodModel: foodProvider.get(),
    scoreModel: scoreProvider.get(),
  ),
);

final gameLoopProvider = Provider<GameLoop>(
  () => GameLoop(
    viewModel: snakeViewProvider.get(),
    input: inputProvider.get(),
    renderView: (vm) {
      consoleViewProvider.get().renderBoard(vm);
    },
  ),
);

final consoleViewProvider = Provider<ConsoleView>(() => ConsoleView());
