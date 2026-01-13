// Wiring only - only wires the dependancies
// MVVM architecture
// correct Dependancy Injection

import 'core/app_provider.dart';

void main() {
  final gameLoop = gameLoopProvider.get();
  gameLoop.start();
}
