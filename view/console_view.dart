// Console view for rendering the board in the terminal
// depends on BoardModel for board dimensions
// single responsibility principle

import 'dart:io';
import '../model/board_model.dart';

class ConsoleView {
  void renderBoard(BoardModel boardModel) {
    for (int i = 0; i < boardModel.height; i++) {
      for (int j = 0; j < boardModel.width; j++) {
        if (j == 0 ||
            j == boardModel.width - 1 ||
            i == 0 ||
            i == boardModel.height - 1) {
          stdout.write('#');
          continue;
        } else {
          stdout.write(' ');
        }
      }
      stdout.writeln();
    }
  }
}
