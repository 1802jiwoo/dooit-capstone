import 'package:capstone_project_2/common/colors.dart';
import 'package:capstone_project_2/data/models/post_model.dart';
import 'package:capstone_project_2/presentantion/providers/community/community_provider.dart';
import 'package:capstone_project_2/presentantion/widgets/communit/hot_talk_item.dart';
import 'package:capstone_project_2/presentantion/widgets/communit/post_item.dart';
import 'package:flutter/material.dart';

import '../../../common/fonts.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final CommunityProvider provider = CommunityProvider();

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.addListener(updateScreen);
    });
  }

  @override
  void dispose() {
    provider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6EFE9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 상단
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    'HEATH TALK',
                    style: boldText(size: 25, color: Colors.black),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search_rounded,
                    size: 30,
                    color: Color(0xFFA6A6A6),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.notifications, color: Color(0xFFA6A6A6), size: 30),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  // 이용공지
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      color: Color(0xFFF1E7DE),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          size: 20,
                          color: Color(0xFFA6A6A6),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '헬스토크 이용가이드',
                          style: mediumText(size: 12, color: Colors.black),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 11,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '지금 HOT TALK',
                        style: boldText(size: 22, color: Colors.black),
                      ),
                      Image.asset('assets/images/Fire1.png', width: 30),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '더보기',
                              style: mediumText(size: 11, color: Colors.white),
                            ),
                            SizedBox(width: 3),
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // hot talk
            SizedBox(
              height: 145,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                children: [
                  for(int i = 0; i < 10; i++)
                    HotTalkItem(
                      teg: '어른즈',
                      title: '회사가 운동을 방해합니다',
                      description:
                      '회사 근처 헬스장에서 운동을 하는데 점심시간에 갔다가 온다고 하니까 해봤자 뭐 얼마나 달라진다고 운동하냐며 그 시간에 일이나 더 하립니다',
                      views: 334,
                      comments: 23,
                      likes: 34,
                    ),
                ],
              ),
            ),
            SizedBox(height: 32),
            // 태그
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryBox(icon: 'star.png', title: '전체'),
                  _categoryBox(icon: 'star.png', title: '어른즈'),
                  _categoryBox(icon: 'star.png', title: '자유'),
                  _categoryBox(icon: 'star.png', title: '헬린이'),
                  _categoryBox(icon: 'star.png', title: '헬스장'),
                  _categoryBox(icon: 'star.png', title: '학생즈'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // 게시글 목록
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.sizeOf(context).height - 550,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  for(int i = 0; i < 10; i++)
                    PostItem(
                      postData: PostModel(
                        writer: '변지우',
                        title: '가보입시더',
                        description: '그래서 제가요 진짜 그랬는데 너무 그래서 너무 그거 해버렸어요 진짜 우짜죠 진짜 진짜로 좀 많이 심각심각한 느낌인데',
                        views: 50,
                        comments: 12,
                        likes: 9,
                        minutes: 5,
                        category: '헬린이',
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryBox({required String icon, required String title}) {
    return Container(
      margin: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          provider.changeCategory(title);
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border:
                    title == provider.selectCategory
                        ? Border.all(width: 3, color: pointColor)
                        : null,
              ),
              child: SizedBox(
                width: 55,
                height: 55,
                child: Image.asset('assets/images/$icon'),
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: mediumText(
                size: 12,
                color:
                    title == provider.selectCategory
                        ? Colors.black
                        : Color(0xFFA6A6A6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
