import 'package:flutter/cupertino.dart';

final MainProvider mainProvider = MainProvider();

class MainProvider extends ChangeNotifier {

  final PageController pageController = PageController();
  int currentIndex = 0;

  void movePage(int index) {
    pageController.jumpToPage(index);
    currentIndex = index;
    notifyListeners();
  }

}