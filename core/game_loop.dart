import 'dart:async';

import '../model/direction_model.dart';
import '../viewmodel/snake_view_model.dart';

class GameLoop {
  final SnakeViewModel viewModel;
  final void Function(SnakeViewModel) renderView;
  Timer? _timer;

  GameLoop({required this.viewModel, required this.renderView});

  void start() {
    if (_timer != null) return; // already running
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      tick();
      // viewModel.moveSnake(DirectionModel.right);
      // renderView(viewModel);
    });
  }

  void tick() {
    if (viewModel.isGameOver) {
      stop();
      print('Game over');
      return;
    }
    viewModel.moveSnake(DirectionModel.right);

    if (viewModel.isGameOver) {
      stop();
      print('Game is over');
      return;
    }
    renderView(viewModel);
  }

  void stop() {
    _timer?.cancel();
  }
}
