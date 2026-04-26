import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/mode_controller.dart';
import '../../../routes/app_pages.dart';

class ModeView extends GetView<ModeController> {
  const ModeView({super.key});

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
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Mode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _ModeCard(
                    imagePath: 'assets/image/tebak_gambar.png',
                    title: 'Tebak Gambar',
                    description: 'Yuk! Kenali alat musik dari gambarnya',
                    onTap: () => Get.toNamed(Routes.LOGIN),
                  ),
                  const SizedBox(height: 20),
                  _ModeCard(
                    imagePath: 'assets/image/tebak_suara.png',
                    title: 'Tebak Suara',
                    description: 'Gunakan pendengaranmu untuk main!',
                    onTap: () => Get.toNamed(Routes.LOGIN),
                  ),
                  const SizedBox(height: 20),
                  _ModeCard(
                    imagePath: 'assets/image/sejarah_alat.png',
                    title: 'Sejarah Alat Musik',
                    description: 'Uji pengetahuanmu tentang sejarah!',
                    onTap: () => Get.toNamed(Routes.LOGIN),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _ModeCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
