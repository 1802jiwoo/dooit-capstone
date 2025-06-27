import 'package:flutter/cupertino.dart';

import '../../../data/models/challenge_list_model.dart';
import '../../../data/models/view_challenge_model.dart';
import '../../../data/repositories/challenge_repository.dart';

class SearchChallengeProvider extends ChangeNotifier {
  final ChallengeRepository challengeRepository = ChallengeRepository();
  final TextEditingController keywordController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  ChallengeListModel? challengesData;
  List<ViewChallengeModel> challenges = [];
  int page = 0;

  void resetKeyword() {
    keywordController.text = '';
    notifyListeners();
  }

  void resetChallenges() {
    challenges = [];
    challengesData = null;
    page = 0;
    notifyListeners();
  }

  void addList() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 300 &&
          !challengesData!.last) {
        page += 1;
        await getChallengesData();
      }
    });
  }

  Future<void> getChallengesData() async {
    if(keywordController.text.isNotEmpty) {
      challengesData = await challengeRepository.getChallengeList(
        '',
        keywordController.text,
        page,
        10,
        '',
      );
      if (challengesData != null && challengesData!.content.isNotEmpty) {
        challenges.addAll(challengesData!.content);
      }
    }
    notifyListeners();
  }
}