// final - board size does not change after initialization
// immutable - properties cannot be changed after object creation
// simple data holder for board dimensions
// required named parameters for clarity when creating an instance

class BoardModel {
  final int height;
  final int width;

  BoardModel({required this.height, required this.width});

  bool containsPoint(int x, int y) {
    return x >= 0 && x < width && y >= 0 && y < height;
  }
}
