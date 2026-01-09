// Provider depends on other Providers

import '../model/board_model.dart';
import '../model/point_model.dart';
import '../model/snake_model.dart';
import '../view/console_view.dart';
import '../viewmodel/snake_view_model.dart';
import 'provider.dart';

final boardProvider = Provider<BoardModel>(
  () => BoardModel(height: 5, width: 10),
);

final snakeProvider = Provider<SnakeModel>(
  () => SnakeModel(head: PointModel(x: 2, y: 3)),
);

final snakeViewProvider = Provider<SnakeViewModel>(
  () => SnakeViewModel(
    boardModel: boardProvider.get(),
    snakeModel: snakeProvider.get(),
  ),
);

final consoleViewProvider = Provider<ConsoleView>(() => ConsoleView());
