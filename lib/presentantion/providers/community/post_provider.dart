import 'package:capstone_project_2/data/models/post_model.dart';
import 'package:flutter/cupertino.dart';

class PostProvider extends ChangeNotifier {
  PostModel? postData;

  void getPostData() {
    postData = PostModel(
      authorName: '김똥개',
      title: '가보실까여',
      content: '제가 요즘 이승기한테 빠졌는데 원래도 진짜 좋아 했지만 앳된 모습 보니까 더 좋아 지더라구여',
      commentCount: 4,
      createdAt: '2025-06-26',
      updatedAt: null,
      id: 2,
      authorId: 22,
      authorTier: '헬고수'
    );
  }
}