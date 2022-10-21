import 'package:get/get.dart';
import 'package:news_app_flutter/core/model/news_model.dart';
import 'package:news_app_flutter/core/service/news_service.dart';

class NewsController extends GetxController {
  final newsApi = Get.put(NewsService());

  var topNews = Rx<List<Articles>>([]);
  var isLoading = false.obs;
  var errorMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    getTopHeadlineData();
  }

  Future<void> getTopHeadlineData() async {
    isLoading.value = true;
    var result = await newsApi.getTopNewsHeadlines();

    if (result.articles.isEmpty) {
      isLoading.value = false;
      errorMessage.value = "Something Went Wrong";
    } else {
      isLoading.value = false;
      topNews.value = result.articles;
    }
  }
}
