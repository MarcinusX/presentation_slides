import 'package:example_flutter/scoped_model.dart';

class PresentationModel extends Model {
  int _index = 0;

  int get index => _index;

  void next() {
    _index++;
    notifyListeners();
  }

  void prev() {
    _index--;
    notifyListeners();
  }
}
