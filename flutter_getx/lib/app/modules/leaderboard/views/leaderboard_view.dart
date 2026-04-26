import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboardData = LeaderboardData.getSampleData();
    final top3 = leaderboardData.sublist(0, 3);
    final rest = leaderboardData.sublist(3);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0A2E),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Papan Skor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 48,
              width: 253,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF241D66), Color(0xFF141040)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const Text(
                'Global',
                style: TextStyle(
                  color: Color(0xFFF59E0B),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildPodiumItem(
                      user: top3[1],
                      avatarSize: 76,
                      borderWidth: 3,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildPodiumItem(
                      user: top3[0],
                      avatarSize: 96,
                      borderWidth: 4,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildPodiumItem(
                      user: top3[2],
                      avatarSize: 76,
                      borderWidth: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
              itemCount: rest.length,
              itemBuilder: (context, index) {
                final user = rest[index];
                final rank = index + 4;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _LeaderboardListItem(rank: rank, user: user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPodiumItem({
    required LeaderboardUser user,
    required double avatarSize,
    required double borderWidth,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(user.avatarPath ?? 'assets/image/profil1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _formatScore(user.score),
          style: const TextStyle(
            color: Color(0xFFFFB020),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  String _formatScore(int score) {
    return score.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}

class _LeaderboardListItem extends StatelessWidget {
  final int rank;
  final LeaderboardUser user;

  const _LeaderboardListItem({required this.rank, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF241D66), Color(0xFF141040)],
        ),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0x1AFFFFFF), width: 1.2),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            child: Text(
              '$rank',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: const DecorationImage(
                image: AssetImage('assets/image/profil1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Skor: ${_formatScore(user.score)}',
                  style: const TextStyle(
                    color: Color(0x99FFFFFF),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            _formatScore(user.score),
            style: const TextStyle(
              color: Color(0xFFFFB020),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatScore(int score) {
    return score.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}

class LeaderboardUser {
  final int id;
  final String name;
  final int score;
  final String? avatarPath;

  const LeaderboardUser({
    required this.id,
    required this.name,
    required this.score,
    this.avatarPath,
  });
}

class LeaderboardData {
  static List<LeaderboardUser> getSampleData() {
    return const [
      LeaderboardUser(
        id: 1,
        name: 'Arya',
        score: 12500,
        avatarPath: 'assets/image/juara1.png',
      ),
      LeaderboardUser(
        id: 2,
        name: 'Maya',
        score: 11800,
        avatarPath: 'assets/image/silver.png',
      ),
      LeaderboardUser(
        id: 3,
        name: 'Budi',
        score: 11200,
        avatarPath: 'assets/image/bronze.png',
      ),
      LeaderboardUser(id: 4, name: 'Citra', score: 10500),
      LeaderboardUser(id: 5, name: 'Joko', score: 9800),
      LeaderboardUser(id: 6, name: 'Rani', score: 9200),
      LeaderboardUser(id: 7, name: 'Anda', score: 8500),
      LeaderboardUser(id: 8, name: 'Rani', score: 9200),
      LeaderboardUser(id: 9, name: 'Rani', score: 9200),
      LeaderboardUser(id: 10, name: 'Rani', score: 7800),
      LeaderboardUser(id: 11, name: 'Rani', score: 5200),
      LeaderboardUser(id: 12, name: 'Rani', score: 5000),
    ];
  }
}
