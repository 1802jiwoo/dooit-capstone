import 'package:capstone_project_2/data/models/user_model.dart';
import 'package:capstone_project_2/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';

final MyProvider myProvider = MyProvider();

class MyProvider extends ChangeNotifier {
  final UserRepository userRepository = UserRepository();

  UserModel? userData;

  int? hour;
  int? minutes;

  void setTime() {
    hour = (userData!.totalExerTime) ~/ 60;
    minutes = (userData!.totalExerTime) % 60;
    notifyListeners();
  }

  Future<void> getMyData() async {
    userData = await userRepository.getMyData();
    notifyListeners();
  }

  List<Map<String, dynamic>> myActivity = [
    {
      'icon': Icons.edit,
      'text': '내가 쓴 리뷰',
      'function': () { print('내가 쓴 리뷰'); }
    },
    {
      'icon': Icons.chat_outlined,
      'text': '두잇 토크 활동',
      'function': () { print('두잇 토크 활동'); }
    },
    {
      'icon': Icons.credit_card,
      'text': '결제 내역',
      'function': () { print('결제 내역'); }
    },
    {
      'icon': Icons.favorite_outline,
      'text': '관심 헬스장',
      'function': () { print('관심 헬스장'); }
    }
  ];

}