import 'package:get_storage/get_storage.dart';
import 'package:flutter_crud_api/app/widgets/message/errorMessage.dart';
import 'package:flutter_crud_api/app/widgets/message/internetMessage.dart';
import 'package:flutter_crud_api/app/widgets/message/successMessage.dart';

class SharedApi {
  String imageUrl = "http://posts.doyatama.com";
  String baseUrl = "https://flutter-api-.vercel.app/api/";

  Map<String, String> getToken() {
    final box = GetStorage();
    String? token = box.read("token");
    if (token != null) return {"Authorization": "Bearer " + token};
    return {"Authorization": "Bearer " + "BadToken"};
  }

  showLoading() {
    loadingMessage();
  }

  stopLoading() {
    stopLoadingMessage();
  }

  showErrorMessage(String message) {
    errorMessage(message);
  }

  showInternetMessage(String message) {
    internetMessage(message);
  }
}
