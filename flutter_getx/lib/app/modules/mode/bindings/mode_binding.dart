import 'package:get/get.dart';

import '../controllers/mode_controller.dart';

class ModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModeController>(
      () => ModeController(),
    );
  }
}
