import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_crud_api/app/data/post_model.dart';
import 'package:flutter_crud_api/app/widgets/custom_alert_dialog.dart';
import 'package:flutter_crud_api/app/services/post_api.dart';
import 'package:flutter_crud_api/app/routes/app_pages.dart';

class DetailPostController extends GetxController {
  final Map<String, dynamic> argsData = Get.arguments;
  PostModel? postModel;
  RxBool isLoading = false.obs;
  RxBool isLoadingCreateTodo = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController contentC = TextEditingController();

  @override
  onClose() {
    titleC.dispose();
    contentC.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    titleC.text = argsData["title"];
    contentC.text = argsData["content"];
  }

  Future<void> deletePost() async {
    CustomAlertDialog.showPresenceAlert(
      title: "Hapus data todo",
      message: "Apakah anda ingin menghapus data todo ini ?",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back(); // close modal
        update();
        postModel = await PostApi().deletePostAPI(argsData["id"]);
        if (postModel!.status == 200) {
          update();
          Get.offAndToNamed(Routes.HOME);
        }
      },
    );
  }
}
