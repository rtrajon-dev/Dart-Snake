import 'dart:io';

import '../../model/direction_model.dart';
import 'input_controller.dart';

class KeyboardInputController implements InputController {
  DirectionModel _direction = DirectionModel.right;

  @override
  DirectionModel get direction => _direction;

  @override
  void start() {
    stdin.transform(SystemEncoding().decoder).listen((line) {
      final key = line.trim().toLowerCase();

      switch (key) {
        case 'w':
          _set(DirectionModel.up);
          break;
        case 's':
          _set(DirectionModel.down);
          break;
        case 'a':
          _set(DirectionModel.left);
          break;
        case 'd':
          _set(DirectionModel.right);
          break;
        case 'q':
          dispose();
          exit(0);
      }
    });
  }

  void _set(DirectionModel newDirection) {
    if (_isOpposite(newDirection, _direction)) return;
    _direction = newDirection;
  }

  bool _isOpposite(DirectionModel a, DirectionModel b) {
    return (a == DirectionModel.up && b == DirectionModel.down) ||
        (a == DirectionModel.down && b == DirectionModel.up) ||
        (a == DirectionModel.left && b == DirectionModel.right) ||
        (a == DirectionModel.right && b == DirectionModel.left);
  }

  @override
  void dispose() {}
}
