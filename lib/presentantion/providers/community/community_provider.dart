import 'package:flutter/cupertino.dart';

class CommunityProvider extends ChangeNotifier {

  String selectCategory = '전체';

  void changeCategory(String newCategory) {
    selectCategory = newCategory;
    notifyListeners();
  }

}