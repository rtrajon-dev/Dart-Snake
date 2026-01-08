// MVVM architecture
// correct Dependancy Injection

import 'model/board_model.dart';
import 'view/console_view.dart';

void main() {
  final board = BoardModel(height: 5, width: 20);
  final view = ConsoleView();

  view.renderBoard(board);
}
