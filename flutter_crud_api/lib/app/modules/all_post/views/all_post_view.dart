import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_post_controller.dart';

class AllPostView extends GetView<AllPostController> {
  const AllPostView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllPostView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AllPostView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
