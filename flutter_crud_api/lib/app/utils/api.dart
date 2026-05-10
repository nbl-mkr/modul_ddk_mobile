import 'package:get_storage/get_storage.dart';
import 'package:flutter_crud_api/app/widgets/message/errorMessage.dart'
    as errorMsg;
import 'package:flutter_crud_api/app/widgets/message/internetMessage.dart'
    as internetMsg;
import 'package:flutter_crud_api/app/widgets/message/successMessage.dart'
    as successMsg;

class SharedApi {
  String imageUrl = "http://posts.doyatama.com";
  String baseUrl = "https://flutter-api-.vercel.app/api/";

  Map<String, String> getToken() {
    final box = GetStorage();
    String? token = box.read("token");
    if (token != null) return {"Authorization": "Bearer " + token};
    return {"Authorization": "Bearer " + "BadToken"};
  }

  showLoading() {}

  stopLoading() {}

  showErrorMessage(String message) {
    errorMsg.showErrorMessage(message);
  }

  showInternetMessage(String message) {
    internetMsg.showInternetMessage(message);
  }

  showSuccessMessage(String message) {
    successMsg.showSuccessMessage(message);
  }
}
