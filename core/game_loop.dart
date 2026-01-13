import 'dart:async';
import '../lib/input/input_controller.dart';
import '../viewmodel/snake_view_model.dart';

class GameLoop {
  final SnakeViewModel viewModel;
  final void Function(SnakeViewModel) renderView;
  final InputController input;

  Timer? _timer;

  GameLoop({
    required this.viewModel,
    required this.input,
    required this.renderView,
  });

  void start() {
    if (_timer != null) return; // already running

    input.start();

    _timer = Timer.periodic(const Duration(seconds: 2), (_) => tick());
  }

  void tick() {
    if (viewModel.isGameOver) {
      stop();
      print('Game over');
      return;
    }
    // viewModel.moveSnake(DirectionModel.right);
    viewModel.moveSnake(input.direction);

    if (viewModel.isGameOver) {
      stop();
      print('Game is over');
      return;
    }
    renderView(viewModel);
  }

  void stop() {
    _timer?.cancel();
    input.dispose();
  }
}
