// Wiring only - only wires the dependancies
// MVVM architecture
// correct Dependancy Injection

import 'core/app_provider.dart';

void main() {
  final view = consoleViewProvider.get();
  final viewModel = snakeViewProvider.get();

  view.renderBoard(viewModel);
}
