import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier,DiagnosticableTreeMixin{
  int _counter = 0;
  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
  void decrementCounter() {
    _counter--;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', _counter));
  }
}