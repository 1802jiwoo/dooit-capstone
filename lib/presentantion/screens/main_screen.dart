import 'package:flutter/material.dart';

import '../providers/main_provider.dart';
import 'challenges/challenge_screen.dart';
import 'community/community_screen.dart';
import 'health_screen.dart';
import 'map_screen.dart';
import 'my_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mainProvider.addListener(updateScreen);
    });
  }

  @override
  void dispose() {
    mainProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: mainProvider.pageController,
          children: [
            HealthScreen(),
            CommunityScreen(),
            MapScreen(),
            ChallengeScreen(),
            MyScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainProvider.currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: (value) {
            mainProvider.movePage(value);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label: '헬스'),
            BottomNavigationBarItem(icon: Icon(Icons.forum_outlined), label: '커뮤니티'),
            BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: '맵'),
            BottomNavigationBarItem(icon: Icon(Icons.flag_outlined), label: '챌린지'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '마이'),
          ],
        ),
      ),
    );
  }
}
