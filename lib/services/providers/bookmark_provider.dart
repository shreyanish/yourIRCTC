import 'package:flutter/cupertino.dart';

List _traincards = [];
List _stationcards = [];

class BookmarkProvider extends ChangeNotifier {
  List get traincards => _traincards;
  List get stationcards => _stationcards;


  void toggleBookmark_t(trainname) {
    final isBookmarked = _traincards.contains(trainname);
    if(isBookmarked) {
      _traincards.remove(trainname);
      print(traincards);
    } else{
      _traincards.add(trainname);
      print(traincards);
    }
    notifyListeners();
  }

  bool isExist_t(trainname) {
    final isExist = _traincards.contains(trainname);
    return isExist;
  }

  void toggleBookmark_s(startstation) {
    final isBookmarked = _stationcards.contains(startstation);
    if(isBookmarked) {
      _stationcards.remove(startstation);
    } else{
      _stationcards.add(startstation);
    }
    notifyListeners();
  }

  bool isExist_s(startstation) {
    final isExist = _stationcards.contains(startstation);
    return isExist;
  }

}