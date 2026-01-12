import 'point_model.dart';

class SnakeModel {
  List<PointModel> body;

  SnakeModel(this.body);
  PointModel get head => body.first;
}
