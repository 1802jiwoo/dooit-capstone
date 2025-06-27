import 'package:capstone_project_2/common/colors.dart';
import 'package:capstone_project_2/presentantion/providers/my_provider.dart';
import 'package:flutter/material.dart';

import '../../common/fonts.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      myProvider.addListener(updateScreen);
      await myProvider.getMyData();
      myProvider.setTime();
    });
  }

  @override
  void dispose() {
    myProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6EFE9),
      // backgroundColor: Colors.white,
      body: myProvider.userData == null ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('내 정보를 불러오는 중 입니다.')
          ],
        ),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            // 상단
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    'MY Dooit',
                    style: boldText(size: 25, color: Colors.black),
                  ),
                  Spacer(),
                  Icon(Icons.settings, size: 30, color: Color(0xFFA6A6A6)),
                  SizedBox(width: 10),
                  Icon(Icons.notifications, color: Color(0xFFA6A6A6), size: 30),
                ],
              ),
            ),
            // 사용자 정보
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      // 프로필 캐릭?
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        height: MediaQuery.sizeOf(context).width * 0.45,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Image.asset('assets/images/profile_image.png', fit: BoxFit.cover,),
                            // Padding(
                            //   padding: EdgeInsets.all(10),
                            //   child: GestureDetector(
                            //     onTap: () {},
                            //     child: Container(
                            //       width: 30,
                            //       height: 30,
                            //       decoration: BoxDecoration(
                            //         shape: BoxShape.circle,
                            //         color: Colors.black,
                            //       ),
                            //       child: Icon(
                            //         Icons.arrow_forward,
                            //         size: 20,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      // 이름 및 포인트
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: litePointColor,
                            ),
                            child: Text(myProvider.userData!.tier, style: boldText(size: 9, color: pointColor),),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            myProvider.userData!.name,
                            style: boldText(size: 18, color: Colors.black),
                          ),
                          SizedBox(height: 10),
                          // 포인트
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/star.png',
                                  width: 25,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  '${myProvider.userData!.totalPoint}',
                                  style: boldText(
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  ' 개',
                                  style: boldText(
                                    size: 16,
                                    color: Color(0xFFA6A6A6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // 총 운동 시간
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time_filled_outlined, size: 40, color: litePointColor,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('지금까지 총', style: mediumText(size: 14, color: greyColor),),
                            SizedBox(height: 4,),
                            Text('${myProvider.hour! == 0 ? ''
                                : myProvider.hour!}${myProvider.hour! == 0 ? '' : '시간'} ${myProvider.minutes! != 0
                                ? myProvider.minutes! : ''}${myProvider.minutes! != 0 ? '분' : ''}',
                              style: boldText(size: 20, color: Colors.black),),
                            SizedBox(height: 4,),
                            Text('동안 운동 했어요', style: mediumText(size: 14, color: greyColor),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  // 선택 항목
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: litePointColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, size: 30, color: pointColor,),
                          SizedBox(width: 10,),
                          Text('상품 구매', style: boldText(size: 16, color: pointColor),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 배너
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: 75,
              color: Color(0xFFFFD452),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: pointColor,
                        ),
                        child: Text(
                          'CUIDE',
                          style: boldText(size: 10, color: Colors.white),
                        ),
                      ),
                      Text(
                        '운동 타이머 헬스장에서 함께!',
                        style: boldText(size: 22, color: Colors.black),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(width: 60, height: 60, color: Colors.blue),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  _myContentBox(title: '나의 활동', content: myProvider.myActivity),
                  SizedBox(height: 15,),
                  _myContentBox(title: '나의 활동', content: myProvider.myActivity),
                  SizedBox(height: 15,),
                  _myContentBox(title: '나의 활동', content: myProvider.myActivity),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myContentBox({required String title, required List<Map<String, dynamic>> content}) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: boldText(size: 11, color: greyColor),),
          ...content.map((e) {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 12),
              width: double.infinity,
              child: GestureDetector(
                onTap: e['function'],
                child: Row(
                  children: [
                    Icon(e['icon'], size: 20, color: greyColor,),
                    SizedBox(width: 12,),
                    Text(e['text'], style: boldText(size: 14, color: Colors.black),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios, size: 20, color: greyColor,),
                  ],
                ),
              ),
            );
          },),
        ],
      ),
    );
  }

  Widget _iconBox({
    required String image,
    required String text,
    required BuildContext context,
  }) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.sizeOf(context).width * 0.2,
            height: MediaQuery.sizeOf(context).width * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/images/$image.png'),
          ),
          SizedBox(height: 10),
          Text(text, style: mediumText(size: 14, color: Colors.black)),
        ],
      ),
    );
  }
}
