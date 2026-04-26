import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0A2E),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const _UserProfileCard(),
                  const SizedBox(height: 24),
                  const _ContinuePlayingSection(),
                  const SizedBox(height: 24),
                  const _DailyMissionsSection(),
                  const SizedBox(height: 24),
                  const _LeaderboardSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserProfileCard extends StatelessWidget {
  const _UserProfileCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF241D66), Color(0xFF141040)],
          stops: [0.03, 1.0],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF59E0B), width: 3),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/image/user_profile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFFF59E0B),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Text(
                    '12',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Musthofa Arya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ImageIcon(
                      AssetImage('assets/image/icon_xp.png'),
                      color: Color(0xFFF59E0B),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '6741 XP',
                      style: TextStyle(
                        color: Color(0xFFF59E0B),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContinuePlayingSection extends StatelessWidget {
  const _ContinuePlayingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Lanjutkan Bermain',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.MODE),
          child: Container(
            width: double.infinity,
            height: 192,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/image/tebak_gambar.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.3),
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Tebak Gambar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Yuk! Kenali alat musik dari gambarnya',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DailyMissionsSection extends StatelessWidget {
  const _DailyMissionsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Misi Harian',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _MissionCard(
          icon: ImageIcon(
            AssetImage('assets/image/icon_mainkan.png'),
            color: Colors.white,
          ),
          title: 'Mainkan 5 Permainan',
          progress: 3,
          total: 5,
          reward: 50,
          iconColor: const Color(0xFFF59E0B),
        ),
        const SizedBox(height: 12),
        _MissionCard(
          icon: ImageIcon(
            AssetImage('assets/image/icon_pelajari.png'),
            color: Colors.white,
          ),
          title: 'Pelajari Tentang\n1 Instrumen',
          progress: 1,
          total: 1,
          reward: 0,
          iconColor: const Color(0xFFF59E0B),
          isCompleted: true,
        ),
      ],
    );
  }
}

class _MissionCard extends StatelessWidget {
  final Widget icon;
  final String title;
  final int progress;
  final int total;
  final int reward;
  final Color iconColor;
  final bool isCompleted;

  const _MissionCard({
    required this.icon,
    required this.title,
    required this.progress,
    required this.total,
    required this.reward,
    required this.iconColor,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF241D66), Color(0xFF141040)],
          stops: [0.03, 1.0],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: icon,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (!isCompleted && reward > 0)
                      Row(
                        children: [
                          Image.asset(
                            'assets/image/icon_footer4.png',
                            color: const Color(0xFFF59E0B),
                            width: 16,
                            height: 16,
                          ),
                          Text(
                            ' +$reward',
                            style: const TextStyle(
                              color: Color(0xFFF59E0B),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    if (isCompleted)
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 24,
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: progress / total,
                          backgroundColor: Colors.white24,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            isCompleted
                                ? Colors.green
                                : const Color(0xFFF59E0B),
                          ),
                          minHeight: 8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '$progress/$total',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LeaderboardSection extends StatelessWidget {
  const _LeaderboardSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LeaderboardItem(rank: 1, name: 'Musthofa Arya', xp: 1800),
        const SizedBox(height: 8),
        _LeaderboardItem(rank: 2, name: 'Ahmadinezka Evan', xp: 1200),
        const SizedBox(height: 8),
        _LeaderboardItem(rank: 3, name: 'Akhmad Daqiqul', xp: 1150),
      ],
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final int rank;
  final String name;
  final int xp;
  final bool isCurrentUser;

  const _LeaderboardItem({
    required this.rank,
    required this.name,
    required this.xp,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF241D66), Color(0xFF141040)],
          stops: [0.03, 1.0],
        ),
        borderRadius: BorderRadius.circular(16),
        border: isCurrentUser
            ? Border.all(color: const Color(0xFFF59E0B), width: 2)
            : null,
      ),
      child: Row(
        children: [
          Icon(
            rank == 1 ? Icons.emoji_events : Icons.emoji_events_outlined,
            color: rank == 1 ? const Color(0xFFF59E0B) : Colors.grey,
            size: 28,
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            child: Image.asset('assets/image/user_papan.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$xp XP',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            '$rank',
            style: TextStyle(
              color: rank == 1
                  ? const Color(0xFFF59E0B)
                  : rank == 2
                  ? Colors.grey.shade400
                  : Colors.grey.shade600,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
