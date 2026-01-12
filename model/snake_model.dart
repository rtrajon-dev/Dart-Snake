import 'point_model.dart';

class SnakeModel {
  // PointModel head;
  // List<PointModel> body;

  // SnakeModel({required this.head});

  List<PointModel> body;
  SnakeModel(this.body);
  PointModel get head => body.first;
}
