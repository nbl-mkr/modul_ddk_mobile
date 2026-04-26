import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_navigation_controller.dart';
import '../../home/views/home_view.dart';
import '../../leaderboard/views/leaderboard_view.dart';
import '../../reward/views/reward_view.dart';
import '../../profile/views/profile_view.dart';
import '../../mode/views/mode_view.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> footerIcons = [
      "assets/image/icon_footer1.png",
      "assets/image/icon_footer2.png",
      "assets/image/icon_footer4.png",
      "assets/image/icon_footer5.png",
    ];

    final List<String> navLabels = [
      "Beranda",
      "Papan Skor",
      "Hadiah",
      "Profil",
    ];

    final List<Widget> pages = [
      const HomeView(),
      const LeaderboardView(),
      const RewardView(),
      const ProfileView(),
      const ModeView(),
    ];

    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFF0D0A2E),
        extendBody: true,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child:
              pages[controller.currentIndex.value < pages.length
                  ? controller.currentIndex.value
                  : 0],
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
        floatingActionButton: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFF59E0B).withAlpha(100),
                    const Color(0xFFF59E0B).withAlpha(50),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF241D66), Color(0xFF141040)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF59E0B).withAlpha(80),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
                border: Border.all(
                  color: controller.currentIndex.value == 4
                      ? const Color(0xFFF59E0B)
                      : const Color(0xFFF59E0B).withAlpha(100),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.currentIndex.value = 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/image/icon_footer3.png',
                        color: controller.currentIndex.value == 4
                            ? const Color(0xFFF59E0B)
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: footerIcons.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? const Color(0xFFF59E0B) : Colors.white;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  footerIcons[index],
                  color: color,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  navLabels[index],
                  style: TextStyle(
                    color: color,
                    fontSize: 10,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            );
          },
          activeIndex: controller.currentIndex.value >= 4
              ? -1
              : controller.currentIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          backgroundColor: const Color(0xff0d0a27),
          splashColor: Colors.transparent,
          splashRadius: 0,
          splashSpeedInMilliseconds: 0,
          onTap: (index) => controller.currentIndex.value = index,
        ),
      ),
    );
  }
}
