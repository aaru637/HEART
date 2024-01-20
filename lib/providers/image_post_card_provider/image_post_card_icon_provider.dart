import 'package:flutter/cupertino.dart';

class ImagePostCardIconProvider extends ChangeNotifier {
  bool _isLikeEnabled = false;
  bool _isBookMarked = false;

  bool get isLikeEnabled => _isLikeEnabled;
  bool get isBookMarked => _isBookMarked;

  void updateLike() {
    _isLikeEnabled = !_isLikeEnabled;
    notifyListeners();
  }

  void updateBookMark() {
    _isBookMarked = !_isBookMarked;
    notifyListeners();
  }
}
