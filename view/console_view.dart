// Console view for rendering the board in the terminal
// depends on BoardModel for board dimensions
// single responsibility principle

import 'dart:io';
import '../viewmodel/snake_view_model.dart';

class ConsoleView {
  void renderBoard(SnakeViewModel viewModel) {
    for (int i = 0; i < viewModel.boardModel.height; i++) {
      for (int j = 0; j < viewModel.boardModel.width; j++) {
        if (j == 0 ||
            j == viewModel.boardModel.width - 1 ||
            i == 0 ||
            i == viewModel.boardModel.height - 1) {
          stdout.write('#');
          continue;
        } else {
          stdout.write(' ');
        }

        if (viewModel.snakeModel.head.x == j &&
            viewModel.snakeModel.head.y == i) {
          stdout.write('O');
        }
      }
      stdout.writeln();
    }
  }
}
