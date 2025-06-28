import 'package:capstone_project_2/presentantion/component/challenge_type_box.dart';
import 'package:capstone_project_2/presentantion/providers/challenges/add_challenge_provider.dart';
import 'package:capstone_project_2/presentantion/widgets/challenges/calendar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/colors.dart';
import '../../../common/fonts.dart';

class AddChallengeScreen2 extends StatefulWidget {
  const AddChallengeScreen2({super.key});

  @override
  State<AddChallengeScreen2> createState() => _AddChallengeScreen2State();
}

class _AddChallengeScreen2State extends State<AddChallengeScreen2> {
  final AddChallengeProvider provider = AddChallengeProvider();

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
    return SafeArea(
      child: Scaffold(
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
                      'ADD CHALLENGE',
                      style: semiBoldText(size: 25, color: Colors.black),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: Color(0xFFA6A6A6),
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    _customTextField(
                      title: '챌린지 이름',
                      controller: provider.titleController,
                    ),
                    SizedBox(height: 20),
                    _customTextField(
                      title: '챌린지 내용',
                      controller: provider.descriptionController,
                      rows: true,
                    ),
                    SizedBox(height: 20),

                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            '챌린지 기간',
                            style: mediumText(
                              size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    // 챌린지 기간
                    GestureDetector(
                      onTap: () async {
                        final result = await showDialog<List<DateTime>>(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState2) {
                                return Dialog(
                                  insetPadding: EdgeInsets.zero,
                                  child: CalendarWidget(setState2: setState2),
                                );
                              },
                            );
                          },
                        );
                        provider.setDate(result!);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: Color(0xFFF1E7DE),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${DateFormat('yyyy-MM-dd').format(provider.start)} ~ ${DateFormat('yyyy-MM-dd').format(provider.end)}',
                              style: semiBoldText(
                                size: 16,
                                color: Color(0xFFA6A6A6),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.calendar_month_outlined,
                              size: 20,
                              color: Color(0xFFA6A6A6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // 챌린지 타입 및 배팅 포인트
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    '챌린지 타입',
                                    style: mediumText(
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              height: 60,
                              child: Row(
                                children: [
                                  ChallengeTypeBox(
                                    type: 'TOTAL',
                                    function: () {
                                      provider.changeChallengeType('TOTAL');
                                      provider.setMaxMinutes();
                                    },
                                    selectType: provider.challengeType,
                                    height: 37,
                                  ),
                                  SizedBox(width: 10),
                                  ChallengeTypeBox(
                                    type: 'DAILY',
                                    function: () {
                                      provider.changeChallengeType('DAILY');
                                      provider.setMaxMinutes();
                                    },
                                    selectType: provider.challengeType,
                                    height: 37,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: _customTextField(
                            title: '배팅 포인트',
                            controller: provider.betPointController,
                            keyboard: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // 운동 시간
                    Row(
                      children: [
                        // 시간 입력
                        Expanded(
                          child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (value) {
                              provider.setHour(value);
                            },
                            children: [
                              for (
                                int i = 0;
                                i <=
                                    (provider.maxMinutes - provider.minutes) ~/
                                        60;
                                i++
                              )
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: Text(
                                    '${i + 0}',
                                    style: semiBoldText(
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          ' 시간',
                          style: semiBoldText(size: 20, color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        // 분 입력
                        Expanded(
                          child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (value) {
                              provider.setMinutes(value);
                            },
                            children: [
                              for (
                                int i = 0;
                                i <= provider.maxMinutes - provider.hour * 60;
                                i++
                              )
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: Text(
                                    '${i + 0}',
                                    style: semiBoldText(
                                      size: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          ' 분',
                          style: semiBoldText(size: 20, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),

                    GestureDetector(
                      onTap: () async {
                        provider.addChallenge(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        width: MediaQuery.sizeOf(context).width * 0.9 - 40,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: pointColor,
                        ),
                        child: Text('챌린지 생성하기', style: semiBoldText(size: 16, color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextField({
    required String title,
    required TextEditingController controller,
    bool rows = false,
    TextInputType keyboard = TextInputType.text,
    String hint = '',
  }) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Row(
            children: [
              SizedBox(width: 20),
              Text(title, style: mediumText(size: 16, color: Colors.black)),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(rows ? 30 : 200),
            color: Color(0xFFF1E7DE),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboard,
            style: semiBoldText(size: 16, color: Colors.black),
            maxLines: rows ? null : 1,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: semiBoldText(size: 16, color: Color(0xFFA6A6A6)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}
