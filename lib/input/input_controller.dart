import '../../model/direction_model.dart';

abstract class InputController {
  DirectionModel get direction;
  void start();
  void dispose();
}
